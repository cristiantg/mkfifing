#!/bin/bash
salida() {
	echo "\n[Server-Interruptus]\n\n"
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
	echo $que nuevo >&4
    done ) 3<request 4>response 
done
