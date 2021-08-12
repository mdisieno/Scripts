#!/usr/bin/bash
#Builds your dev environment, and if it is already there, it will handle the cloning and pulling. 
input=0
if [ $# -eq 0 ]
then
    while [ $input -eq "0" ]
    do
        printf "Welcome to Mike's Dev Env Builder.\n"
        sleep 1
        clear
        ./awker.sh configFile
        printf "
        What would you like to do?

        1.Git Clone
        2.Git Pull
        3.MVN Clean, Compile, then Install
        4.Run program
        Q.Quit
        "
        printf "
        (For future reference, you can put this number as the first argument)\n

        Choice: " 
        read input
        case $input in 

            1)
            clear && echo "Cloning"
            ;;
            2)
            clear && echo "Pulling"
            ;;
            3)
            clear && echo "MVN Cleaning, Compiling, Installing"
            ;;
            4)
            clear && echo "WORK IN PROGRESS"
            ;;
            Q|q)
            exit
            ;;
            *)
            clear && echo -n "Do it all? ALRIGHT!" && clear

            ;;
        esac
    done
fi 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
gitCloner(){
#git clone 
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
gitPuller(){
#git pull 
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mvncci(){
alias mvncci="mvn clean && mvn compile && mvn clean"

}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
runProgram(){

}

