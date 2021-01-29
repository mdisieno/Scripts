!#/bin/bash
#This is a simple script that will make a screen session for you, take in arguements and handle the transfer.
arg1=$1
arg2=$2

#Working on cleaning this part. Check back later for updates

screen -R RCloneCopier -dm bash -c "rclone copy -vP $1 $2 && 
./pushmessage "Copy Done!" "Your copy for $1 is done. && sleep 5s && exit"
"


