
Here’s a comprehensive `README.md` file for your GitHub repository. It includes everything from setup instructions to usage, troubleshooting, and legal notes. You can save this as `README.md` in your repository.

----------

# 🔐 Aircrack-ng Automation Script
**Automate WPA/WPA2 Handshake Capture and Cracking**

![Aircrack-ng Logo](https://www.aircrack-ng.org/resources/aircrack-ng-new-logo.jpg)

---

## 📌 Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Manual Deauthentication](#manual-deauthentication)
- [Troubleshooting](#troubleshooting)
- [Legal and Ethical Considerations](#legal-and-ethical-considerations)
- [Contributing](#contributing)
- [License](#license)

---

## 📋 Introduction
This repository contains a **Bash script** to automate the process of capturing a WPA/WPA2 handshake and cracking the password using **Aircrack-ng**. The script is designed for **Kali Linux** and requires root privileges.

---

## ✨ Features
- Automatically kills conflicting processes.
- Enables monitor mode on your wireless interface.
- Scans for nearby Wi-Fi networks.
- Captures WPA/WPA2 handshakes.
- Cracks passwords using a wordlist.
- Provides instructions for manual deauthentication.

---

## 🛠 Prerequisites
- **Kali Linux** (or any Linux distribution with Aircrack-ng installed)
- **Wireless card** supporting monitor mode (e.g., `wlan0`)
- **Aircrack-ng suite** (`airodump-ng`, `aireplay-ng`, `aircrack-ng`)
- **Wordlist** (e.g., `rockyou.txt`)

Install the required tools:
sudo apt update && sudo apt install aircrack-ng

----------

## 📥 Installation

1.  **Clone the repository**:
    
    `git clone https://github.com/yourusername/aircrack-ng-automation.git cd aircrack-ng-automation`
    
2.  **Make the script executable**:
    
    `chmod +x aircrack_auto.sh`
    

----------

## 🚀 Usage

1.  **Run the script**:
    
    `sudo ./aircrack_auto.sh`
    
2.  **Follow the prompts**:
    
    -   Press `Ctrl+C` after identifying your target network.
    -   Enter the **BSSID**, **channel**, and **filename** when prompted.
    -   Copy the `aireplay-ng` command and run it in a new terminal tab (see [Manual Deauthentication](#manual-deauthentication)).
3.  **Wait for the handshake** to be captured, then let the script attempt to crack the password.
    

----------

## 🔄 Manual Deauthentication

1.  **Copy the `aireplay-ng` command** printed by the script.
2.  **Open a new terminal tab** and paste the command:
    
    `aireplay-ng --deauth 0 -a <BSSID> <MON_INTERFACE>`
    
3.  **Return to the original tab** and press **Enter** to continue capturing the handshake.

----------

## ❓ Troubleshooting

Issue

Solution

**Monitor mode fails**

Check if your wireless card supports monitor mode.

**No handshake captured**

Ensure you are close enough to the target network.

**Aircrack-ng fails**

Verify the wordlist path and ensure the handshake was captured.

**Network is down**

Restart your network interface: `systemctl restart NetworkManager`.

----------

## ⚠ Legal and Ethical Considerations

-   **Only test networks you own or have explicit permission to test.**
-   Unauthorized testing is **illegal** and unethical.
-   Use this guide for **educational purposes only**.

----------

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1.  Fork the repository.
2.  Create a new branch (`git checkout -b feature-branch`).
3.  Commit your changes (`git commit -m "Add new feature"`).
4.  Push to the branch (`git push origin feature-branch`).
5.  Open a Pull Request.

----------

## 📄 License

This project is licensed under the **MIT License**. See the LICENSE file for details.

----------

## 📧 Contact

For questions or feedback, please open an issue or contact me at [rehanfaisal455@gmail.com](mailto:rehanfaisal455@gmail.com).
