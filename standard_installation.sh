#!/bin/bash

#set -eu -o pipefail # fail on error and report it, debug all lines

sudo -n true
test $? -eq 0 || exit 1 "you should have sudo privilege to run this script"

sudo apt-get update
sleep 2

echo deb http://archive.ubuntu.com/ubuntu/ bionic universe | sudo tee /etc/apt/sources.list.d/bionic.list
sleep 2

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4EB27DB2A3B88B8B && sudo apt update
sleep 2

sudo apt-get upgrade -y

#Zoom installing
wget https://zoom.us/client/5.12.6.173/zoom_amd64.deb -P /tmp
sudo apt install ./tmp/zoom_amd64.deb

#slack installing
wget https://downloads.slack-edge.com/releases/linux/4.28.184/prod/x64/slack-desktop-4.28.184-amd64.deb -P /tmp
sudo sudo apt install ./tmp/slack-desktop-4.28.184-amd64.deb

sudo apt install mysql-server -y

#MySQL Workbench
wget https://github.com/satyapraneet63/installation-files/raw/main/mysql-workbench-community_8.0.16-1ubuntu18.04_amd64.deb -P /tmp
sudo apt install ./tmp/mysql-workbench-community_8.0.16-1ubuntu18.04_amd64.deb

#Any_Desk Installing
wget https://download.anydesk.com/linux/anydesk_6.2.0-1_amd64.deb -P /tmp
sudo apt install ./tmp/anydesk_6.2.0-1_amd64.deb

#intellij IDE
sudo snap install intellij-idea-community --classic

#sudo apt --fix-broken install -y
sudo apt install git git-lfs -y
git lfs install
