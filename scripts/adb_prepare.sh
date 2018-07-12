#!/bin/sh


ip=$1
echo connect $1 ...

adb kill-server
sleep 1
adb connect $1
sleep 1
adb root $1
sleep 1
adb disconnect $1
sleep 1
adb connect $1
sleep 1
adb shell
