#!/bin/bash
echo "Выберите, что вы хотите сделать:"
echo "1) Установка"
echo "2) Удаление скрипта"
echo "3) Редактирование"
read x
if test $x -eq 1; then
echo
echo "Создание конфигурации сервера"
sudo wget -O /etc/profile.d/sshinfo.sh https://raw.githubusercontent.com/mazeram/motd/main/mazeram-info.sh
echo "Скрипт установлен"
 
# runs this if option 2 is selected
elif test $x -eq 2; then
sudo rm /etc/profile.d/sshinfo.sh
echo "Скрипт удалён"
# runs this if option 3 is selected
elif test $x -eq 3; then
sudo nano /etc/profile.d/sshinfo.sh
exit
fi
