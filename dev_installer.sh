#!/bin/bash

DOWNLOAD_PATH=~/downloads

DEVEL_HOME=~/devel

#download programs
PROGRAMS=$(find downloads/)
for P in $PROGRAMS;
do
	if [ -f $P ]
	then
		P_NAME=$(echo $P | cut -d\/ -f2)
		P_FILE=$(cat $P | cut -d\| -f1)
		P_URL=$(cat $P | cut -d\| -f3)
		if [ ! -f $DOWNLOAD_PATH/$P_FILE ]
		then
			wget --no-check-certificate $P_URL -O $DOWNLOAD_PATH/$P_FILE
		else
			#todo check md5
			echo OK $P_FILE
		fi
	fi
done

#install programs
for P in $PROGRAMS;
do
	if [ -f $P ]
	then
		P_NAME=$(echo $P | cut -d\/ -f2)
		P_FILE=$(cat $P | cut -d\| -f1)
		P_INSTALL_DIR=$(cat $P | cut -d\| -f2)
		P_URL=$(cat $P | cut -d\| -f3)
		if [ ! -d $DEVEL_HOME/$P_INSTALL_DIR -a -f install/$P_NAME.sh  ]
		then
			sh install/$P_NAME.sh $P_NAME $P_FILE $P_INSTALL_DIR $DEVEL_HOME $DOWNLOAD_PATH
		fi
	fi
done
