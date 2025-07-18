#!/bin/bash
mkdir -p ../logs
echo "Generating user audit report..."
report_file="../logs/users_report.log"

echo "Users created in last 7 days:" > $report_file
awk -F: '{ print $1 " -> " $3 }' /etc/passwd | while read user
do
  user_info=$(chage -l "$user" 2>/dev/null | grep "Account created")
  echo "$user | $user_info" >> $report_file
done

echo -e "\nUsers with sudo access:" >> $report_file
getent group sudo | cut -d: -f4 >> $report_file
echo "Audit complete. Report saved to $report_file"

