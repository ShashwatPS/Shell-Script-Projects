#!/bin/bash

#$Author: Shashwat Singh$
#$Monday 25th of September 2023$

#Variables
BASE=Files
DAYS=5
DEPTH=1
RUN=0

#Checking if the direcotry is present or not
if [ ! -d $BASE ]
then
	echo "directory does not exists: $BASE"
        exit 1
fi

#Create Archive Folder if not Present
if [ ! -d $BASE/archive ]
then
	mkdir $BASE/archive
fi

#Find the list of Files larger than your required size
for i in `find $BASE -maxdepth $DEPTH -type f -size +2M`
do
	if [ $RUN -eq 0 ]
	then
		gzip $i || exit 1
		mv $i.gz $BASE/archive || exit 1
	fi
done	
