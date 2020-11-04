#!/usr/bin/env bash

################################################################################
# Source https://mailinabox.email/ https://github.com/mail-in-a-box/mailinabox #
# Updated by Dirty Harry for YiiMP use...                                      #
# This script is intended to be ran from the Yiimp Server Installer            #
################################################################################

if [ -z "${TAG}" ]; then
	TAG=v1.0
fi

# Clone the Yiimp repository if it doesn't exist.
if [ ! -d $HOME/yiimpserver/yiimp_single ]; then
	echo Downloading Dirty Harry Yiimp Single Server Installer ${TAG}. . .
	git clone \
		-b ${TAG} --depth 1 \
		https://github.com/DirtyHarryDev/server_yiimp_single \
		$HOME/yiimpserver/yiimp_single \
		< /dev/null 2> /dev/null

	echo
fi

# Change directory to it.
cd $HOME/yiimpserver/yiimp_single

# Update it.
sudo chown -R $USER $HOME/yiimpserver/install/.git/
if [ "${TAG}" != `git describe --tags` ]; then
	echo Updating Dirty Harry Yiimp Single Server Installer to ${TAG} . . .
	git fetch --depth 1 --force --prune origin tag ${TAG}
	if ! git checkout -q ${TAG}; then
		echo "Update failed. Did you modify something in `pwd`?"
		exit
	fi
	echo
fi

# Start setup script.
cd $HOME/yiimpserver/yiimp_single
source start.sh
