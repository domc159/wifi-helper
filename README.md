# Wi-Fi Toolkit

A bash menu-driven wrapper script designed to simplify the usage of several popular wireless network tools such as `airodump-ng`, `mdk4`, `aireplay-ng`, `reaver`, and `bully`. This toolkit provides an interactive CLI menu to perform wireless scanning, deauthentication attacks, beacon flooding, denial of service (DoS) attacks, EAPOL injection, WPA/WPA2 handshake capturing, and WPS attacks.


---

## 🌟 Features

- **📡 Wi-Fi Scanner:** Scan for available wireless networks
- **💥 Deauthentication Attack:** Targeted or broad deauth attacks on BSSID, SSID, or channels
- **📢 Beacon Flooding:** Send fake beacon frames with customizable SSID lists to flood the airwaves
- **🚫 Authentication DoS:** Denial of Service attacks on access points or client stations
- **🔐 EAPOL 802.1X Injection:** Inject packets to disrupt authentication processes or force re-authentication
- **🤝 WPA/WPA2 Handshake Collector:** Capture WPA/WPA2 handshakes for offline password cracking
- **🔑 WPS Attack:** Perform WPS PIN recovery attacks using Reaver or Bully tools
- **⚙️ Interface Management:** Prepare, select, and restore wireless network interfaces for monitor mode

---

## 📋 Requirements

Required tools include:
- `airodump-ng`
- `mdk4`
- `aireplay-ng`
- `reaver`
- `bully`
- `hashcat`
- `wireless-tools`
- `macchanger`
- `python3` and venv tools

---

## 🚀 Installation

### Automatic Installation (Debian-based systems)

The script can install required packages automatically on Debian-based systems (Ubuntu, Debian, Raspbian):

1. Clone the repository:
```bash
git clone https://github.com/domc159/wifi-helper.git
cd wifi-toolkit
```

2. Make the script executable:
```bash
chmod +x main.sh
```

3. Run the script and install packages:
```bash
./main.sh
# Select option 'pp' to install packages
```

### Manual Installation

For other Linux distributions, install the required packages using your package manager before running the script.

---

## 📖 Usage

1. Run the script:
```bash
./main.sh
```

2. Select from the interactive menu to perform various wireless network operations

3. The script will guide you through:
   - Setting up monitor mode interfaces
   - Executing attacks or scans
   - Customizing options (target BSSID, SSID, channels, magnitude)

---

## 🎯 Menu Options

| Option | Description |
|--------|-------------|
| **1** | 📡 Wi-Fi Scanner |
| **2** | 💥 Deauthentication Attack |
| **3** | 📢 Beacon Flooding |
| **4** | 🚫 Authentication Denial of Service Attack (DoS) |
| **5** | 🔐 EAPOL 802.1X Injection |
| **6** | 🤝 Capture WPA/WPA2 Handshake |
| **7** | 🔑 WPS Attack (Reaver or Bully) |
| **a** | ⚙️ Prepare Interface for Monitor Mode |
| **b** | 🔄 Reselect Interface |
| **c** | 🛠️ Restore Interface |
| **p** | 📊 Show Processes Running Related to Wi-Fi Attacks |
| **pp** | 📦 Install Required Packages |
| **q** | ❌ Quit |

---

## 👤 Author

**SpacePirate**

---

## ⚠️ Legal Disclaimer

**IMPORTANT:** This project is designed for **educational and authorized penetration testing purposes only**.

- 🔴 **Only use this toolkit on networks you own or have explicit written permission to test**
- 🔴 **Unauthorized access to computer networks is illegal in most countries**
- 🔴 **The author is not responsible for any misuse of this toolkit**
- 🔴 **Users are solely responsible for complying with applicable laws and regulations**

### Ethical Usage Guidelines

- ✅ Use for learning cybersecurity concepts
- ✅ Use for authorized penetration testing
- ✅ Use for securing your own networks
- ❌ Do not use against networks without permission
- ❌ Do not use for malicious purposes
- ❌ Do not use to cause harm or disruption

---

## 📝 License

This project is provided "as is" without warranty of any kind. Use at your own risk.

---

## 🤝 Contributing

Contributions are welcome! Please ensure any contributions maintain the educational focus and include appropriate warnings about legal usage.


---

**Remember: With great power comes great responsibility. Use this toolkit ethically and legally!** 🛡️
