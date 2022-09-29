#!/bin/bash


pingAmount=-1
timeoutSec=1
userName=""
exeName=""
i=0



while [ $# -gt 0 ]
do

	case "$1" in   
		"-c")
			 pingAmount="$2"
			 shift
			 shift
			 ;;
			 
		"-t")
			 timeoutSec="$2"
			 shift
			 shift
			 ;;
			 
		"-u")
			userName="$2"
			shift
			shift
			;;
			
		*)
			exeName="$1"
			shift
			;;
	esac
	
done



if [[ -z $userName ]] ; then
	echo "Pinging ‘$exeName’ for any user"

	echo "Pinging ‘$exeName’ for user ‘$userName’"
fi

while true
do
	if [ $pingAmount -eq $i ] ; then
		break
	fi
	
	psCount=$(eval ps -ef | grep "$exeName" | grep "$userName" | wc -l)
	echo "$exeName: $psCount instance(s)..."
	sleep $timeoutSec
	i=$(( $i + 1 ))
	
done
