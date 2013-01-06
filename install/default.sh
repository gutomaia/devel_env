#!/bin/bash

if [ "$#" -eq 5 ]; then
	P_NAME="$1"
	P_FILE="$2"
	P_INSTALL_DIR="$3"
	DEVEL_HOME="$4"
	DOWNLOAD_PATH="$5"

	cd $DEVEL_HOME && \
		tar -zxvf $DOWNLOAD_PATH/$P_FILE

	ln -s $P_INSTALL_DIR $P_NAME
fi
