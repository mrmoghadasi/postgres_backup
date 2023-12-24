#!/bin/bash
# Database name
db_name=pg_name

# Backup storage directory
backupfolder=~/postgresql/backups


# Number of days to store the backup
keep_day=30

sqlfile=$backupfolder/$db_name-$(date +%Y-%m-%d_%H-%M).sql
zipfile=$backupfolder/$db_name-$(date +%Y-%m-%d_%H-%M).zip
logfile=$backupfolder/db_backup.log

#create backup folder
mkdir -p $backupfolder

# Create a backup

if pg_dump $db_name > $sqlfile ; then
   echo 'Sql dump created' >> $logfile
else
   echo 'pg_dump return non-zero code' >> $logfile
   exit
fi

# Compress backup
if gzip -c $sqlfile > $zipfile; then
   echo 'The backup was successfully compressed' >> $logfile
else
   echo 'Error compressing backup' >> $logfile
   exit
fi




rsync -arvz --rsync-path="sudo rsync" -e 'ssh -p ssh_port' $zipfile ssh_user@backup_server_ip:/home/pg_name/ >> $logfile
rsync -arvz --rsync-path="sudo rsync" -e 'ssh -p ssh_port' $sqlfile ssh_user@backup_server_ip:/home/pg_name/ >> $logfile


# Delete old backups
find $backupfolder -mtime +$keep_day -delete >> $logfile
