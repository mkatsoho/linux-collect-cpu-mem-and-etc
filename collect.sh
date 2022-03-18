#!/usr/bin/env bash


LogFile=${1:-/tmp/collect_cpu_usage.log}

echo "Save CPU usage to $LogFile"
echo
echo
sleep 2





# CPU_USAGE=$(top -b -n2 -p 1 | fgrep "Cpu(s)" | tail -1 | awk -F'id,' -v prefix="$prefix" '{ split($1, vs, ","); v=vs[length(vs)]; sub("%", "", v); printf "%s%.1f%%\n", prefix, 100 - v }')


while [ 2 -gt 1 ]
do

	CPU_USAGE=$(top -b -n2 -p 1 | fgrep "Cpu(s)" | tail -1) 

	DATE=$(date "+%Y-%m-%d %H:%M:%S")
	CPU_USAGE="$DATE CPU: $CPU_USAGE"

	echo $CPU_USAGE | tee -a $LogFile
done
