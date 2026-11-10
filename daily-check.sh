#!/bin/bash

figlet -f big DailyCheck
echo =================================================
# user input
echo "Siapa nama anda?"
read nama
if [ "$nama" == "Haikal" ];
then echo "Halo $nama, saya akan menampilkan laporan hari ini!"
else echo "akses ditolak" && exit
fi

sleep 1
echo "================================================="
sleep 1
echo "Hostname anda '$(hostnamectl hostname)'"
echo $(hostnamectl | grep Operating)
echo "sesi login anda saat ini '$(whoami)'"
echo "groups sesi login anda '$(groups $USER)'"
echo "informasi lengkap tentang sesi login anda:"
cat /etc/passwd | grep $(whoami)

echo "================================================="
echo "pengecekan internet...."
ping 8.8.8.8 -c 4 | tail -n 2
echo "================================================="
echo "[pengecekkan status layanan yang sudah terinstall]"
echo "================================================="
echo "Layanan yang akan di cek (network, firewall, ssh, login, bluetooth)"
echo "//bisa anda sesuaikan layanan apa saja yang ingin di cek (custom)"
sleep 1
echo "================================================="
echo "[Network status]" 
systemctl status NetworkManager | grep Active
echo "================================================="
echo "[Firewall status]"
systemctl status ufw | grep Active
echo "================================================="
echo "[SSH status]"
systemctl status sshd | grep Active
echo "================================================="
echo "[Login status]" 
systemctl status sddm | grep Active
echo "================================================="
echo "[Bluetooth status]"
systemctl status bluetooth | grep Active
echo "================================================="

sleep 1
echo "---------------------[WARNING]---------------------"
echo "'Script ini difungsikan untuk daily check server/device"
echo " yang menggunakan linux dan layanan yang dikelola oleh"
echo " systemd, seperti distro keluarga Arch dan Debian!'"
echo "--------------------------------------------------"


echo "Apakah informasi sudah cukup untuk anda? Y/N"
read cukup
if [[ "$cukup" =~ ^(Y|y|YA|Ya|ya|yes|Yes|YES)$ ]];
then echo "Baik, selamat tinggal!" && exit
else echo "Saya rasa itu sudah cukup, selamat tinggal!" && exit
fi