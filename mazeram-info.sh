#!/bin/bash
#
# Text Color Variables http://misc.flogisoft.com/bash/tip_colors_and_formatting
tcLtG="\033[00;37m"    # LIGHT GRAY
tcDkG="\033[01;30m"    # DARK GRAY
tcLtR="\033[01;31m"    # LIGHT RED
tcLtGRN="\033[01;32m"  # LIGHT GREEN
tcLtBL="\033[01;34m"   # LIGHT BLUE
tcLtP="\033[01;35m"    # LIGHT PURPLE
tcLtC="\033[01;36m"    # LIGHT CYAN
tcW="\033[01;37m"      # WHITE
tcBl="\e[5m"           # BLINK
tcLBo="\e[38;5;215m"        # ORANGE(2)

tcRESET="\033[0m"
tcORANGE="\033[38;5;209m"
#
# Time of day
HOUR=$(date +"%H")
if [ $HOUR -lt 12  -a $HOUR -ge 0 ]; then TIME="morning"
elif [ $HOUR -lt 17 -a $HOUR -ge 12 ]; then TIME="afternoon"
else TIME="evening"
fi
#
# System uptime
uptime=`cat /proc/uptime | cut -f1 -d.`
upDays=$((uptime/60/60/24))
upHours=$((uptime/60/60%24))
upMins=$((uptime/60%60))
#
# CPU info
CPU_MODEL=`cat /proc/cpuinfo | grep -E 'model name' | head -n 1 | awk '{print $4" "$5" "$6}'`
CPU_FREQ=`cat /proc/cpuinfo | grep -E 'cpu MHz' | awk '{print $4 / 1000.0}'`
CPU_CORES=`nproc`
# System + Memory
SYS_LOADS=`cat /proc/loadavg | awk '{print $1}'`
MEMORY_USED=`free -b | grep Mem | awk '{print $3/$2 * 100.0}'`
SWAP_USED=`free -b | grep Swap | awk '{print $3/$2 * 100.0}'`
NUM_PROCS=`ps aux | wc -l`
OS_RELEASE=`hostnamectl | grep -E 'Operating System' | awk '{print $3" "$4" "$5" "$6}'`
# Network
IPADDRESS=`hostname --all-ip-addresses`
VNSTAT_T=`vnstat | grep today | awk '{print $8" "$9}'`
#Disk info
DISK_USAGE=`df -h / | grep / | awk '{print $2}'`
DISK_FREE=`df -h / | grep / | awk '{print $3}'`

#
echo -e "$tcDkG ==============================================================="
echo -e $tcLtG "        Uptime: $upDays days $upHours hours $upMins minutes      $tcORANGE   MAZERAM.com"
echo -e $tcDkG "==============================================================="
echo -e $tcLtG " - Hostname      :$tcW `hostname -f`"
echo -e $tcLtG " - CPU model     :$tcW $CPU_MODEL $tcRESET$CPU_CORES$tcLtG core(s)"$tcRESET
echo -e $tcLtG " - IP Address    :$tcW $IPADDRESS"
echo -e $tcLtG " - Release       :$tcW $OS_RELEASE `uname -a | awk '{print $1" "$3" "$12}'`"
echo -e $tcLtG " - Disk          : $tcLBo$DISK_FREE / $DISK_USAGE"$tcRESET
echo -e $tcLtG " - Users         : Currently `users | wc -w` user(s) logged on"
echo -e $tcLtG " - Server Time   : `date`"
echo -e $tcLtG " - System load   : $SYS_LOADS / $NUM_PROCS processes running"
echo -e $tcLtG " - Memory used % : $MEMORY_USED"
echo -e $tcLtG " - Swap used %   : $SWAP_USED"
echo -e $tcDkG "==============================================================="
echo -e $tcRESET ""
#