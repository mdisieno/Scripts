#!/bin/bash
################################################################
# Awker
#
# Just a simple script to handle awk commands based on variables pushed.
# It then sets files within ./Files to the directories and such needed.
#
# By Michael Disieno
################################################################

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Variables
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fileToCheck=$1
Home=$HOME
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Functions (WIP)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Puller(){

    local FileToCheck=$1
    local WhatToLookFor=$2
    local WhereToSave=$3
    local repoFile="./Files/Repos"
    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # Checking and Cleaning Repo/Directories
    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    #Create Repos location
    #Pulls the repos set as Repos in configFile, then print 3rd
    awk '{
        if($1 == "#REPO")
        { print $3 }
    }' $fileToCheck > $repoFile 

    #??? Checker
    #printf "Repos:\n" && cat ./files/Repos && printf "\n"
    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    #Directory Creator
    # go through each line, use / as breaks and print 3rd
    awk -F'/' '{ print $3 }' $repoFile > ./Files/RepoDirectories

    #??? Checker
    #printf "Directories:\n" && cat ./files/Directories && printf "\n"
    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # Working Directory Cleaning and setting
    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    #StorageLocation
    #awk '{
    #if($1 == "#FOLDER")
    #{ print $3 }
    #    }' $fileToCheck > ./Files/WorkingDirectory

    WorkingDirectory=$(awk '{
        if($1 == "#FOLDER")
        { print $3 }
    }' $fileToCheck)


    #Check that things are Working
    WorkingDirectory="$Home$WorkingDirectory" 
    echo "$WorkingDirectory" > ./Files/WorkingDirectory


    #??? Checker
    #printf "Working Directory:\n" && cat ./Files/WorkingDirectory && printf "\n"
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Main Body
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Puller $1











