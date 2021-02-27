#!/bin/bash
echo "Choose what you want to do:"
echo "1) Install motd"
echo "2) Remove motd"
echo "3) Edit"
read x
if test $x -eq 1; then
echo
echo "Creating a motd file"
sudo cat /dev/null > /etc/motd
sudo  wget -O /etc/profile.d/sshinfo.sh https://raw.githubusercontent.com/mazeram/motd/main/mazeram-info.sh
echo "Motd installed"
 
# runs this if option 2 is selected
elif test $x -eq 2; then
sudo  rm /etc/profile.d/sshinfo.sh
echo "Motd removed"
# runs this if option 3 is selected
elif test $x -eq 3; then
sudo  nano /etc/profile.d/sshinfo.sh
exit
fi
