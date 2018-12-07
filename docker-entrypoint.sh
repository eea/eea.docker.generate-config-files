#!/bin/sh


touch  /docker.log
# Provide FILE_CONTENTS_* and FILE_LOCATION_* via environment variable
for item in `env`; do
   case "$item" in
       FILE_CONTENTS_*)
            ENVVAR=`echo $item | cut -d \= -f 1`
            sufix="${ENVVAR#FILE_CONTENTS_*}"
            echo "Fount variable $ENVVAR in environment" >> /docker.log
            if [ -n "FILE_LOCATION_$sufix" ]; then
		    file_location=`printenv FILE_LOCATION_$sufix`
		    printenv $ENVVAR  > $file_location
		    echo "Writing $ENVVAR contents to $file_location" >> /docker.log
            else
		    echo "Did not find FILE_LOCATION_$sufix variable value in environment, please check your parameters!" >> /docker.log
            fi
	    
            ;;
   esac
done


exec "$@"
