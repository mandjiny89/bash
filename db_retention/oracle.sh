#!/bin/bash
#set -x 
# This script is created for Oracle DB backup cleaning as per the client request, it check the latest backup file as per the file and delete any file older than the actual file day+2

hostname=$(hostname)
D=`date +%y%m%d%H%M`
LOGFILE="/sapmedia_BOTP/cleanbackups/centrallog"

cd /backup_BOTP
FolderList=$(ls |awk 'length ==3')
for folders in $FolderList
do
        cd /backup_BOTP/$folders/
        ls |grep sapbackup
        if [ `echo $?` == 0 ]
        then
        	cd /backup_BOTP/$folders/sapbackup/
#	        LastBackup_3=$(ls -ltr |awk '{print $9}' |awk 'length ==8'|tail -n1)
		LastBackup_3=$(ls -ltr | egrep '^d' |awk '{print $9}' |awk 'length ==8'|tail -n1)
		Value=good
        	OracleLogCheck=`less /backup_BOTP/db_backup/centrallog |grep $LastBackup_3 |head -1`
	        OracleStatus_1=`echo $OracleLogCheck |cut -c1-8`
        	OracleStatus_2=`echo $OracleLogCheck |cut -c61-65`
	        Final_3="$LastBackup_3$Value"
        	Final_4="$OracleStatus_1$OracleStatus_2"
		DayOld=`perl -l -e 'print -M $ARGV[0], " days"' "$LastBackup_3" |cut -d . -f1`
                DayOld2=`echo $DayOld+2 |bc`
        if [ $Final_3 == $Final_4 ]
        then
                echo "$folders $D Successfull Oracle backup copy found, deleting old files" >>$LOGFILE
                cd /backup_BOTP/$folders/sapbackup/
		find . -mtime +$DayOld2 -name "*" -exec rm -r {} \;
	else
		echo "$folders $D Unsuccessfull bakcup copy found, no deletion done" >>$LOGFILE
        fi
      fi
done
#set
