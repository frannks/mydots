#!/usr/bin/env sh

# Root Checker
if [ "$EUID" -ne 0 ]
  then echo "Execute esse script como ROOT!"
  exit
fi

# Diretorio(s) de backup
clear && read -p "Digite o caminho absoluto do diretório para fazer o backup: " backup_path

# Diretório de destino
DIR="/mnt/backup"
if [ ! -d "$DIR" ] ; then
  sudo mkdir /mnt/backup
  sudo mount -v /dev/sdb1 /mnt/backup
else
  sudo mount -v /dev/sdb1 /mnt/backup
  clear
fi
external_storage="/mnt/backup"

# Fomato do arquivo
read -p "Digite o nome do arquivo: " file_name
date_format=$(date "+%d-%m-%Y")
date_log=$(date "+%d-%m-%Y_%H:%M:%S")
final_archive="$file_name-backup-$date_format.tar.gz"

# LOGS
log_file="/var/log/daily-backup.log"

# Checagem de dispositivos
if ! mountpoint -q -- $external_storage ; then
  printf "[$date_log] Device not mounted in: $external_storage Check it.\n" >> $log_file
  sudo umount -Rf /mnt/backup
  exit 1
fi

# Execução do backup
if tar -czSpf "$external_storage/$final_archive" $backup_path ; then
  printf "[$date_log] Backup sucess.\n" >> $log_file
  sudo umount -Rf /mnt/backup

else
  printf "[$date_log] Backup error.\n" >> $log_file
  sudo umount -Rf /mnt/backup
fi
