#!/bin/bash
################################################################
# gitPuller
#
#Basic git pull script setup by Dave for building the git pull
#with a bit of polish from Mike.
#
# By Michael Disieno
################################################################

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Functions (WIP)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GoalDirectoryMaker(){
    #Simple method to pass in direct arguements 
    DirToAdd=$1
    BuilderDir=$BuilderDirectory
    GoalDirectory="$BuilderDirectory$DirToAdd"

}
WorkingDirectoryBuilder(){
    #If Working Directory does not exists
    GoalDirectoryMaker "/Files/WorkingDirectory"
    WorkingDirectory=$(cat $GoalDirectory)
    if [ ! -d "$WorkingDirectory" ] 
    then
        #Create the directory
        printf "Working Directory Folder was not found\nMaking it now..."
        mkdir $WorkingDirectory
    fi
}
##~~~~~ WORKING ON ##############################################
Cloner(){
    printf "\n"
    cd $WorkingDirectory
    GoalDirectoryMaker "/Files/CurrentDirectories"
    CurrentDirectories=$GoalDirectory
    ls ./ > $CurrentDirectories
    printf "Current Directory: $CurrentDirectories" && sleep 5
    ####################################################################################
    while IFS= read -r line; 
    do
        sleep 2
        clear
        lineCount=$((lineCount+1))
        printf "$lineCount. $line : "
        
        while IFS= read -r nextLine; 
        do
            if [[ "$line" -eq "$nextLine" ]]
            then
                cd $line && git pull && cd ..
                repoFound=true
                break
            fi
        done < $CurrentDirectories
        if [ $repoFound == false ]
        then

            GoalDirectoryMaker "/Files/Repos" && Repos=$GoalDirectory
            git clone $(awk -v REPOLOCATION=$lineCount 'NR==REPOLOCATION' "$Repos")
            sleep 10
        else
            repoFound=false
        fi
        sleep 1
    done < $RepoDirectory
}


DirectoryMakerWIP(){
    #Work in Progress
    #checks folder based on awk
    #ex:
    #$1     $2    $3
    #/home/mike/DEBuilder
    #/home/mike/Tester
    #/home/mike/Tester/Files
    curDirectoryTier=0
    goalDirectoryTier=0
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Variables
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Awks Basic Files and Info
./awker.sh ./configFile
# Cleared at Start
BuilderDirectory="$(pwd)"
GoalDirectory=""
lineCount=0 
repoFound=false
Command=$1
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Main Body
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#if no arguements or set to clone
if [ $# -eq 0 ] || [ $1 -eq "clone" ];
    then
    clear
    printf "Welcome to Mike's Git Ripper.\n"
    sleep 2 
    printf "\n"
    printf "Checking your repos now.....\n"
    sleep 2 && clear
    #Goes through folders to see what is in the working directory. 
    WorkingDirectoryBuilder
    #Push Directory to Cloner for Reading
    GoalDirectoryMaker "/Files/RepoDirectories" && RepoDirectory=$GoalDirectory
    Cloner
    
fi 

#######DO_NOTES########################

#git clone git@ssh.dev.azure.com:v3/gc2it-eng/UtilitiesPP/UtilitiesPP
#git clone git@ssh.dev.azure.com:v3/gc2it-eng/CloudV2/CloudV2
#git clone git@ssh.dev.azure.com:v3/gc2it-eng/CMF/CMF
#git clone git@ssh.dev.azure.com:v3/gc2it-eng/JavaMap/JavaMap
#git clone git@ssh.dev.azure.com:v3/gc2it-eng/DIS/DIS

#Move DEBuilder to a home location and make all locations relative to a base folder.
