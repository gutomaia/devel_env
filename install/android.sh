#!/bin/bash

if [ "$#" -eq 5 ]; then
	P_NAME="$1"
	P_FILE="$2"
	P_INSTALL_DIR="$3"
	DEVEL_HOME="$4"
	DOWNLOAD_PATH="$5"

	cd $DEVEL_HOME && \
		unzip $DOWNLOAD_PATH/$P_FILE

	$DEVEL_HOME/$P_DIR/tools/android update sdk --filter tools,platform-tools,android-17,android-16,android-15,android-14,android-13,android-12,android-11,android-10 --no-ui --force
fi
