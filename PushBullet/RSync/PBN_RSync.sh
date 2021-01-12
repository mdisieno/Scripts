#run from new box
#!/bin/bash
mkdir /home/username/lock exec {lock_fd}>/home/username/lock/migrate || exit 1 flock -n "$lock_fd" || { echo 
"ERROR: flock() failed." >&2; exit 1; } if [ -z "$STY" ]; then exec screen -dm -S downloadmigration /bin/bash 
"$0"; fi rsync -aHAXxv --numeric-ids --info=progress2 -e "ssh -p portnumberhere" 
username@oldhost:remote/home/username/ local/home/username/ curl -s -o /dev/null -u"APIKEYHERE:" 
"https://api.pushbullet.com/v2/pushes" -d type=note -d title="Rsync completed" -d body="Rsync on name Completed" 
-d channel_tag=channelhere-vvv
flock -u "$lock_fd"
