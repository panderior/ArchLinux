#!/bin/bash

# This is a script to update an Arch Linux System
# Needed packages: reflector, aura, yay

echo -e "\n---------------------------"
echo -e "<= System update started =>"
echo -e "---------------------------\n"

### Step 1: update mirror list
echo -e "-> backing up mirrorlist \n"
# truncate mirrorlist backup files
sudo truncate -s 0 /etc/pacman.d/mirrorlist.bak
sudo truncate -s 0 /etc/pacman.d/mirrorlist.pacnew.bak
# backup mirrorlist files
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo cp /etc/pacman.d/mirrorlist.pacnew /etc/pacman.d/mirrorlist.pacnew.bak

echo -e "\n-> updating mirror list \n"
# update mirrorlist files using reflector
# using both mirrorlist and mirrorlist.pacnew files because ~
# ~ not sure which one the system uses

# update mirrorlist file using reflector
sudo reflector --download-timeout 20 --country "KR,JP,TW,GB,US" --protocol "http,https" --latest 100 --sort rate --save /etc/pacman.d/mirrorlist
# truncate all the contents of mirrorlist.pacnew file
sudo truncate -s 0 /etc/pacman.d/mirrorlist.pacnew
# replicate the content of mirrorlist file to mirrorlist.pacnew file
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.pacnew

### Step 2: updating packages from official repo
echo -e "\n-> updating packages from official repo \n"
# create packages snapshot
sudo aura -B
# sync repo indexes
sudo pacman -Syyy
# update system packages
sudo pacman -Syu

# Step 3: updating packages from aur repo
echo -e "\n-> updating packages from aur repo \n"
# create packages snapshot
sudo aura -B
# update aur packages
yay -Syu

echo -e "\n------------------------------"
echo -e "<= System update successful =>"
echo -e "------------------------------\n"

