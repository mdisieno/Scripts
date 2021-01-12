#!/bin/bash
#this script does a simple screen session of the copy and once done exits the session.
#I will be adding pushbullet support to this for notification over a channel.

screen -dmS MidnightCopier timeout 10h rclone copy -vP --fast-list --max-transfer 725G {MountLocation}: /{local location}/ && sleep 5m && exit
