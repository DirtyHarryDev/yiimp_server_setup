################################################################################
# Source https://mailinabox.email/ https://github.com/mail-in-a-box/mailinabox #
# Updated by Dirty Harry for YiiMP use...                                      #
# This script is intended to be ran from the Yiimp Server Installer            #
################################################################################

source /etc/functions.sh

RESULT=$(dialog --stdout --nocancel --default-item 1 --title "Dirty Harry Yiimp Server Installer v1.0" --menu "Choose one" -1 60 16 \
' ' "- YiiMP Server Install -" \
1 "YiiMP Single Server" \
' ' "- More Will Be Added Later -" \
2 Exit)
if [ $RESULT = ]
then
bash $(basename $0) && exit;
fi

if [ $RESULT = 1 ]
then
clear;
cd $HOME/yiimpserver/install
source bootstrap_single.sh;
fi

if [ $RESULT = 2 ]
then
clear;
exit;
fi
