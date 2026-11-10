#!/bin/bash
#--- KODE GAYA (FORMATTING) ---
RESET='\e[0m'
BOLD='\e[1m'
DIM='\e[2m'
UNDERLINE='\e[4m'
BLINK='\e[5m'
INVERT='\e[7m'
# --- WARNA TEKS NORMAL (FOREGROUND) ---
BLACK='\e[30m'
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
PURPLE='\e[35m'
CYAN='\e[36m'
WHITE='\e[37m'
# --- WARNA TEKS TEBAL (BOLD FOREGROUND) ---
BBLACK='\e[1;30m'
BRED='\e[1;31m'
BGREEN='\e[1;32m'
BYELLOW='\e[1;33m'
BBLUE='\e[1;34m'
BPURPLE='\e[1;35m'
BCYAN='\e[1;36m'
BWHITE='\e[1;37m'
# --- WARNA LATAR BELAKANG (BACKGROUND) ---
BGBLACK='\e[40m'
BGRED='\e[41m'
BGGREEN='\e[42m'
BGYELLOW='\e[43m'
BGBLUE='\e[44m'
BGPURPLE='\e[45m'
BGCYAN='\e[46m'
BGWHITE='\e[47m'

echo "***********************************************************"
echo "------------------------[PERINGATAN]-----------------------"
echo "sebelum menjalankan file ini, ada hal yang perlu diperhatikan"
echo "1. Harus install figlet"
echo "2. Harus install fastfetch"
echo "3. File permission harus executable"
echo "4. Nama harus terdaftar"
read -p "Siapa nama anda? " nama
echo -e "${CYAN} "
if [[ "$nama" == "Lutfiana" || "$nama" == "Haikal" || "$nama" == "Admin" || "$nama" == "Administrator" || "$nama" == "SMK" ]]
then echo "Halo $nama nama anda terdaftar, selamat datang!" && figlet -f slant ${nama}
else echo "Maaf, $nama tidak memiliki akses untuk file ini" && exit
fi

fastfetch

tampilkan_menu() {
echo "*******************************************"
echo "A. Melihat sesi login dan groups"
echo "B. Melihat port yang aktif"
echo "C. Melakukan installasi layananan (bisa custom) [root]"
echo "D. Mengecek layanan yang terinstall (bisa custom) [root]"
read -p "Pilih menu yang tersedia (ketik A, B, C, D) " pilihan

if [ "$pilihan" == "A" ]
then echo " "
echo "Pilihan (A)"
echo "- Sesi login di komputer anda: $(whoami)"
echo "- Group sesi login anda: $(groups)"
echo "============================================"

elif [ "$pilihan" == "B" ];
then echo "Pilihan (B)"
echo Port yang aktif di komputer anda: 
echo "$(ss -tulpn | grep LISTEN)"
echo "============================================"

elif [ "$pilihan" == "C" ];
then
    echo "Pilihan (C)"
    read -p "Anda akan melakukan installasi layanan apa? " layanan
    if [[ "$layanan" == "Apache2" || "$layanan" == "bind9" ]]; then
    echo "Install $layanan"
    apt-get install $layanan
    else echo "Layanan tidak dikenali"
    fi
elif [ "$pilihan" == "D" ];
then echo "Pilihan (D)"
echo "Status SSH"
echo "$(systemctl status sshd | grep Active)"
echo "============================================"
echo "Status Apache2"
echo "$(systemctl status apache2 | grep Active)"
echo "============================================"
else echo "Input tidak valid"
fi
}

tampilkan_menu

pertanyaan_akhir() {
read -p "Apakah informasi sudah cukup? Y/N " informasi
if [[ "$informasi" == "N" || "$informasi" == "n" ]]
then tampilkan_menu
else echo "Terimakasih!"
fi
}
pertanyaan_akhir
tampilkan_menu
pertanyaan_akhir