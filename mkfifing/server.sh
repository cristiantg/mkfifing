#!/bin/bash
salida() {
	echo -e "\n[Server-Interruptus]\n\n"
	exit $1
}

trap 'salida 2' 2

# Loop forever (just in case the client closes the pipe)
while true
do
  ( cat <&3 | while read que
    do
	./server-load.sh $que
	# Answer to the client with the task done
	#echo $que >&4
	IFS=' ' read -ra ADDR <<< "$que"
	echo  ${ADDR[2]}/${ADDR[3]} >&4
    done ) 3<request 4>response 
done
