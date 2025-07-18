#!/bin/bash

# Description: Generates a report of users created in last 7 days and lists users with sudo access.
# Author: Your Name
# Date: $(date)

# Create logs directory if not exists
mkdir -p ../logs
report_file="../logs/users_report.log"

echo "🧠 Generating user audit report..."
echo "========== User Audit Report ==========" > "$report_file"
echo "Generated on: $(date)" >> "$report_file"
echo "" >> "$report_file"

# Users created in last 7 days (UID >= 1000, non-system users)
echo "👥 Users created in last 7 days:" >> "$report_file"
awk -F: '$3 >= 1000 { print $1 }' /etc/passwd | while read -r user; do
    user_info=$(chage -l "$user" 2>/dev/null | grep "Account created" | cut -d: -f2-)
    if [[ -n "$user_info" ]]; then
        echo "$user | Created on:$user_info" >> "$report_file"
    fi
done

# Users with sudo access
echo "" >> "$report_file"
echo "🛡️ Users with sudo access:" >> "$report_file"
sudo_users=$(getent group sudo | cut -d: -f4)
if [[ -n "$sudo_users" ]]; then
    echo "$sudo_users" | tr ',' '\n' >> "$report_file"
else
    echo "No sudo users found." >> "$report_file"
fi

echo "" >> "$report_file"
echo "✅ Audit complete. Report saved to $report_file"

