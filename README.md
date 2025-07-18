# 🧠 User Audit & Sudo Access Reporter

A lightweight Bash utility that generates a clean report of:

- 💻 Lists users created in the last 7 days (with UID ≥ 1000)
- 🛡️ Users with sudo access
- 📄 Saves everything to a structured log file for audits or compliance


---

## ⚙️ How to Use

1. **Clone the Toolkit**
   ```bash
   git clone https://github.com/durganshyadav/smart-system-toolkit.git
   cd smart-system-toolkit/scripts

2. Run the Audit Module
   bash user_audit.sh

3. View the Report
   cat ../logs/users_report.log


📋 Example Output
    ========== User Audit Report ==========
Generated on: Mon Jul 15 22:30:21 IST 2025

👤 Users created in last 7 days:
user -> 1001 | Created on: MONTH X, 2025

🛡️ Users with sudo access:
durgansh, admin

🧠 What’s Under the Hood
Reads from /etc/passwd and filters UID ≥ 1000
Uses chage to find account creation info
Parses sudo group using getent
Structured logging to logs/users_report.log

---

## 🔧 Dependencies
None. Everything is built-in:

- `bash`
- `awk`
- `chage`
- `getent`
- `cut`
---

## 📁 Project Structure
```
smart-system-toolkit/
├── logs/
│   └── users_report.log       # Generated output
├── scripts/
│   └── user_audit.sh          # This script
├── .gitignore
├── README.md
```

---

## 🚀 Coming Soon

- [ ] Daily cron job integration
- [ ] Email report module
- [ ] Log rotation system
- [ ] Multi-user report diff tool

---

## 📫 Contact
Feel free to connect via [LinkedIn](https://www.linkedin.com/in/durganshyadav/) or open an issue if you have suggestions or problems.
