#!/bin/bash
clear

export PATH=/luna/run
# // Menjalankan Pungsi Dengan Crontab
########################################
### MEMASANG PUNGSI AUTO KE CRONTAB ###
########################################
echo " Memasang autobackup ke crontab "
# // Jalankan pungsi Limit-ssh setiap 1 menit
echo "*/50 * * * *  root /usr/local/sbin/otwbackup" >>/etc/crontab
sleep 1
echo " Memasang limit ssh ke crontab "
# // Jalankan pungsi Limit-ssh setiap 1 menit
echo "*/1 * * * *  root /luna/run/limit-ssh" >>/etc/crontab
sleep 1
echo " Memasang Autokill ssh ke crontab "
echo "*/1 * * * *  root /luna/run/kill-ssh $iplimit" >>/etc/cron.d
sleep 1
#echo " memasang Autorestart service "
#echo "*/1 * * * * root /usr/local/sbin/res-xray" >> /etc/crontab
#sleep 1
clear
########################################
#### MEMASANG PUNGSI AUTO KE CRON.D ####
########################################
cat >/etc/cron.d/autobackup<<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/50 * * * * root /usr/local/sbin/otwbackup
END
echo "\e[92;1m Memasang limit ssh ke cron.d \e[0m"
# // Jalankan pungsi Limit-ssh setiap 1 menit
echo "*/1 * * * *  root /luna/run/limit-ssh" >>/etc/cron.d/limit-ssh
sleep 1
echo "\e[92;1m Memasang autokill ssh ke cron.d \e[0m"
echo "*/1 * * * *  root /luna/run/kill-ssh" >>/etc/cron.d/kill-ssh
echo " Memasang autokill xray ke cron.d "
echo "*/1 * * * * root /usr/local/sbin/killSS" >> /etc/cron.d/autokil-ssr
echo "*/1 * * * * root /usr/local/sbin/killTR" >> /etc/cron.d/autokil-tro
echo "*/1 * * * * root /usr/local/sbin/killVL" >> /etc/cron.d/autokil-vle
echo "*/1 * * * * root /usr/local/sbin/killVM" >> /etc/cron.d/autokil-vme
systemctl daemon-reload
sleep 2
clear
echo -e "\e[93;1mIzinkan Service \e[0m"
# // Mengizinkan Service
systemctl enable xray
systemctl enable nginx
systemctl enable udp-mini
systemctl enable limit
systemctl enable cron
systemctl enable noobzvpns
echo -e "\e[93;1mJalankan Service \e[0m"
# // Menjalankan Service
systemctl restart xray
systemctl restart nginx
systemctl restart cron
systemctl restart noobzvpns
clear
echo -e "\e[92;1m Succesfully installed All Service \e[0m"
sleep 2
clear
cd
