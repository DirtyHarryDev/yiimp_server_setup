#!/usr/bin/env bash

################################################################################
# Source https://mailinabox.email/ https://github.com/mail-in-a-box/mailinabox #
# Updated by Dirty Harry for YiiMP use...                                      #
# This script is intended to be ran from the Yiimp Server Installer            #
################################################################################

# Clone the MultiPool repository if it doesn't exist.
if [ ! -d $HOME/yiimpserver/yiimp_multi ]; then
	echo Downloading Dirty Harry Yiimp Multi Server Installer ${TAG}. . .
	git clone \
		https://github.com/DirtyHarryDev/server_yiimp_multi \
		$HOME/yiimpserver/yiimp_multi \
		< /dev/null 2> /dev/null

	echo
fi

# Start setup script.
cd $HOME/yiimpserver/yiimp_multi
source start.sh
