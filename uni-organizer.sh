#!/bin/bash

#how many arguments provided 
if [ "$#" -eq 0 ]|| [ "$#" -gt 1 ]; then
    echo "Zero arguments provided or too many arguments provided"
    echo "Please specify a single directory to organize"
    exit 1
else

    PATH="$1" #variable declaration of path

    #change these variables as need be
    CODING="CIS2910"
    ENGNDES="ENGG2100"
    CIRCUITS="ENGG2450"
    GEOG="GEOG1220"
    MATH="MATH2130"
    COMPORG="ENGG3380"


    if [ -d "$PATH" ]; then #is a directory exit
        echo "file is directory"

        for files in "$PATH"/*; do #iterate through every file
            file_full="$files" #reference to full path
            file_path=$(/usr/bin/basename "$files") #compare only file name
          
            
            #change these case names as need be 
            case $file_path in 
                *"$MATH"*)
                    echo "File: $file_path" #output file being compared
                    echo "Moving file to Math Directory..."
                    /usr/bin/mv "$files" "/home/vboxuser/Desktop/MATH2130" #move specified file to correct dir (could change path to 'mv' but for some reason unrecognized cmd)
                    ;;
                *"$CODING"*)
                    echo "File: $file_path" 
                    echo "Moving file to Coding Directory..."
                    /usr/bin/mv "$files" "/home/vboxuser/Desktop/CIS2910"
                    ;;
                *"$ENGNDES"*)
                    echo "File: $file_path" 
                    echo "Moving file to Eng Design Directory..."
                    /usr/bin/mv "$files" "/home/vboxuser/Desktop/ENGG2100"
                    ;;
                *"$CIRCUITS"*)
                    echo "File: $file_path" 
                    echo "Moving file to Circuits Directory..."
                    /usr/bin/mv "$files" "/home/vboxuser/Desktop/ENGG2450"
                    ;;
                *"$GEOG"*)
                    echo "File: $file_path" 
                    echo "Moving file to GEOG Directory..."
                    /usr/bin/mv "$files" "/home/vboxuser/Desktop/GEOG1220"
                    ;;
                *"$COMPORG"*)
                    echo "File: $file_path" 
                    echo "Moving file to Comp Org Directory..."
                    /usr/bin/mv "$files" "/home/vboxuser/Desktop/ENGG3380"
                    ;;
                *)
                    echo "File: $file_path" 
                    echo "No Matching Classes"
                    ;;
            esac

        done

    else #not a directory exit
        echo "FILE IS NOT DIRECTORY"
        exit 1
    fi

fi
