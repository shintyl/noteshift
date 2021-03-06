#!/bin/bash

export QT_QPA_PLATFORM=offscreen

inotifywait -m /var/www/html/uploads/ -e create -e moved_to |
    
    while read path action file; do
	
        echo "The file '$file' appeared in directory '$path' via '$action'"

	rm /var/www/html/123.txt
	
	./omr.sh $file
	./transpose.sh $file
	./musescore.sh $file

	touch /var/www/html/123.txt
	echo "hello" > /var/www/html/123.txt

	printf "made signal"
	
    done

