#!/bin/bash

if [ "$#" -eq 5 ]; then
	P_NAME="$1"
	P_FILE="$2"
	P_INSTALL_DIR="$3"
	DEVEL_HOME="$4"
	DOWNLOAD_PATH="$5"

	cd $DEVEL_HOME && \
		tar -zxvf $DOWNLOAD_PATH/$P_FILE
	
	#install maven plugin
	$DEVEL_HOME/eclipse/eclipse -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/juno/ -installIU org.eclipse.m2e.feature.feature.group -nosplash
	#install git plugin
	$DEVEL_HOME/eclipse/eclipse -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/juno/ -installIU org.eclipse.egit.feature.group -nosplash
	
	if [ -f $DEVEL_HOME/android ]; then
		#install android adt plugin
		$DEVEL_HOME/eclipse/eclipse -application org.eclipse.equinox.p2.director -repository https://dl-ssl.google.com/android/eclipse -installIU com.android.ide.eclipse.adt.feature.group -nosplash
		#install android ndk plugin
		$DEVEL_HOME/eclipse/eclipse -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/juno/ -installIU org.eclipse.cdt.feature.group -nosplash
		$DEVEL_HOME/eclipse/eclipse -application org.eclipse.equinox.p2.director -repository https://dl-ssl.google.com/android/eclipse -installIU com.android.ide.eclipse.ndk.feature.group -nosplash
	fi
fi
