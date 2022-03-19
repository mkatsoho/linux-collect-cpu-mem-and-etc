#!/usr/bin/env bash


LogFile=${1:-/tmp/collect_cpu_usage.log}
LogFile2=${1:-/tmp/collect_per_cpu_usage.log}

CpuNum=$(top -b -n1 -p 1 | grep '%Cpu' | wc -l)
TailLineNum=$(expr $CpuNum + 2)


echo "Must to setup Prereq, according README file"
ls -l ~/.toprc


echo "Save $CpuNum CPU(s) and Mem usage to $LogFile and $LogFile2"
echo
echo
sleep 2



while [ 2 -gt 1 ]
do

	# collect cpu, mem usage
	CPU_USAGE=$(top -b -n2 -p 1 | grep "Cpu(s)\|Mem :\|Swap:" | tail -3)
	DATE=$(date "+%Y-%m-%d %H:%M:%S")
	CPU_USAGE="$DATE CPU: $CPU_USAGE"
	echo $CPU_USAGE | tee -a $LogFile

	# collect each cpu usage
	DATE=$(date "+%Y-%m-%d %H:%M:%S")
	# top -b -n2 -p 1 | grep "%Cpu\|Mem :\|Swap:" | tail -$TailLineNum | sed -e "s/^/$DATE /" 
	# top -b -n2 -p 1 | grep "%Cpu" | tail -$TailLineNum | sed -e "s/^/$DATE /" >> $LogFile2
	top -b -n2 -p 1 | grep "%Cpu" |  sed -e "s/^/$DATE /" >> $LogFile2
done
