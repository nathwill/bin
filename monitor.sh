#!/bin/bash

stats=`hostname`'-> cpu idle: '`iostat|gawk '{if (NR==4) print $6 }'`', uptime: '`uptime |gawk '{print $3 " "$4" load: "$10 $11 $12}'`', disk usage: '`df -h|gawk '{if (NR==2) print $5}'`', free mem: '`free -m|gawk '{if (NR==3) print $4}'`'M'
echo $stats | /usr/bin/twidge update 2>&1 /dev/null
exit 0
