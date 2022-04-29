#!/bin/bash

dir=`dirname $0`
source_file="$dir/users_list.txt"

#settings: enter backup directory
backup_directory="/opt"

backup_name=$(echo `LANG=C date` | awk -F ' |:' {'print"backup_"$2"_"$3"_"$8"_"$4"_"$5"_"$6'})
backup_path="$backup_directory/$backup_name.tar"
#echo $backup_path

#iter_num=1

for user_data in `cat $source_file`; do

login=$(echo "$user_data" | awk -F ',' {'print $1'})
echo "delete user with login:$login..."

if [ "$1" == "with-backup" ];
then
tar --directory="/home" -rf $backup_path $login &>> /dev/null

#echo $backup_path
#echo $login

if [ $? -ne 0 ];then
echo "backup error: user directory does not exist"
else
echo "backup done"
fi
fi

deluser --remove-home "$login" &>>/dev/null

if [ $? -ne 0 ];then
echo "delete error: user does not exist"
else
echo "delete done"
fi

echo ""

#[ $iter_num -eq 3 ]&& exit 8
#iter_num=$(($iter_num+1))

done
