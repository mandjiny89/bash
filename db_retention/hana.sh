#!/bin/bash
#set -x
# This script is created for HANA DB backup cleaning as per the client request, it check the latest backup file as per the file and delete any file older than the actual file day+2

hostname=$(hostname)
D=`date +%y%m%d%H%M`
LOGFILE="/sapmedia_BOTP/cleanbackups/centrallog"

cd /backup_BOTP
FolderList=$(ls |awk 'length ==3')
for folders in $FolderList
do
        cd /backup_BOTP/$folders/
	DIRECTORY=`ls -ltr |grep LOG |cut -c1`
        if [ "$DIRECTORY"  == d ]
        then
    		cd /backup_BOTP/$folders/LOG/DB_$folders/
       		LastBackup=$(ls -ltr |grep DB| tail -n1 |awk '{ print $9 }')
	        FIRST=`echo $LastBackup |cut -c1-3`
        	SECOND=`echo $LastBackup |cut -c4-5`
	        THIRD=`echo $LastBackup |cut -c6-17`
		FOURTH=good
		DayOld=`perl -l -e 'print -M $ARGV[0], " days"' "$LastBackup" |cut -d . -f1`
		DayOld2=`echo $DayOld+2 |bc` 
        	LogCheck_3=`less /backup_BOTP/db_backup/centrallog |grep DB |grep $THIRD |grep $folders`
	        Status_1=`echo $LogCheck_3 |cut -c1-3`
        	Status_2=`echo $LogCheck_3 |cut -c5-6`
	        Status_3=`echo $LogCheck_3 |cut -c8-19`
	        Status_4=`echo $LogCheck_3 |cut -c68-72`
        	Final_1="$FIRST$SECOND$THIRD$FOURTH"
	        Final_2="$Status_1$Status_2$Status_3$Status_4"
        if [ $Final_1 == $Final_2 ]
        then
                echo "$folders $D Successfull HANA backup copy found, removing old backup files" >>$LOGFILE
                cd /backup_BOTP/$folders/LOG/DB_$folders/
		find . -mtime +$DayOld2 -name "*" -exec rm {} \;
        else
                echo "$folders $D Unsccessfull backup copy found, no deletion work" >>$LOGFILE
        fi
       fi
done
#set 
