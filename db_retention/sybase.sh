#!/bin/bash
#set -x
# This script is created for Sybase DB backup cleaning as per the client request, it check the latest backup file as per the file and delete any file older than the actual file day+2
hostname=$(hostname)
D=`date +%y%m%d%H%M`
LOGFILE="/media/clean/log"



cd /backup
FolderList=$(ls |awk 'length ==3')
#echo $FolderList >>$LOGFILE
for folders in $FolderList
do
        cd /backup/$folders/
#echo "$folders within for loop">>$LOGFILE
	ls |grep dmp
#ls |grep dmp >>$LOGFILE
#sleep 3	
       	if [ `echo $?` == 0 ] 
	then
#		echo "$folders This is Sybase DB backup deletion script"
#		echo "$folders This is Sybase DB backup deletion script" >>$LOGFILE
        	cd /backup/$folders/
	     #   ls -lrt |grep DB |tail -1
        	RAW=$(ls -ltr |grep DB| tail -n1 |awk '{ print $9 }')
	        echo $RAW
#        	Log=$(`ls -ltr |grep log`) 
	        FIRST=`echo $RAW |cut -c1-3`
        	echo $FIRST
	        SECOND=`echo $RAW |cut -c4-5`
        	echo $SECOND
	        THIRD=`echo $RAW |cut -c6-17`
       		echo $THIRD
		FOURTH=good
		DayOld=`perl -l -e 'print -M $ARGV[0], " days"' "$RAW" |cut -d . -f1`
                DayOld2=`echo $DayOld+2 |bc`
	        LogCheck=`less /backup/db/log |grep DB |grep $THIRD |grep $folders`
        	echo $LogCheck
        	Status_1=`echo $LogCheck |cut -c1-3`
	        echo $Status_1
        	Status_2=`echo $LogCheck |cut -c5-6`
	        echo $Status_2
        	Status_3=`echo $LogCheck |cut -c8-19`
		echo $Status_3
        	Status_4=`echo $LogCheck |cut -c68-72`
	        echo $Status_4
        	Final_1="$FIRST$SECOND$THIRD$FOURTH"
	        echo $Final_1
        	Final_2="$Status_1$Status_2$Status_3$Status_4"
	        echo $Final_2i
#echo $THIRD  >>$LOGFILE
#echo $Final_1 "and "$Final_2 >>$LOGFILE
        if [ $Final_1 == $Final_2 ]
        then
                echo "Successfull sybase DB copy find and deleting all other old files"
                echo "$folders $D Successfull sybase DB copy find and deleting all other old files" >>$LOGFILE
                cd /backup/$folders
                pwd
		find . -mtime +$DayOld2 -name "*" -exec rm {} \;
		#exit
        else
                echo "Unsccessfull backup copy found no deletion work happening"
                echo "$folders $D Unsccessfull backup copy found no deletion work happening" >>$LOGFILE
        fi
      fi
done
#set x
