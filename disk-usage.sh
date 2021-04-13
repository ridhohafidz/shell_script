#!/bin/sh
SUBJECT="Disk Usage Report on "`date`""
MESSAGE="/tmp/disk-usage.out"
MESSAGE1="/tmp/disk-usage-1.out"
TO="mridhohafidz12@gmail.com"

echo "---------------------------------------------------------------------------------------------------" >> $MESSAGE1
echo "Hostname     Filesystem Size Used Avail Use% Mounted on" >> $MESSAGE1
echo "---------------------------------------------------------------------------------------------------" >> $MESSAGE1
for server in `more /home/ridho/servers.txt`
do
output=`ssh $server df -Ph | tail -n +2 | sed s/%//g | awk '{ if($5 > 85) print $0;}'`
echo "$server: $output" >> $MESSAGE
done
cat $MESSAGE | grep G | column -t >> $MESSAGE1
mail -s "$SUBJECT" "$TO" < $MESSAGE1
rm $MESSAGE
rm $MESSAGE1
