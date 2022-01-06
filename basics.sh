#! /bin/bash

# Run this to see everybody/hosts on the network for the subnet
nmap -sP 1.2.3.0/24

# TCP SYN Scan, aint nobody tripping over this
sudo nmap -sS 1.2.3.0/24

# Show everything with as many details, probably gonna trip some automated alarms
sudo nmap -O 1.2.3.0/24

# Show active network connections on local machine
# What is thsi good for?
netstat -untap

# Find a file in the home directory
find ~/ -type f -name "postgis-2.0.0"

# Find a file containing a string
grep -Ril 'indian' ~/

# Find a file in some other directory 
find "files/" -mindepth 1 -maxdepth 2 -type f -print0 | xargs -0 -I {} echo "{}" > output2.txt

# Show DNS entries 
nmcli --fields ip4.dns,ip6.dns con show $(nmcli -t --fields NAME con show --active)


# Show all video devices
v4l2-ctl --list-devices

# Add your user to an applicaitons user group
sudo usermod -a -G your-app-or-usergroup $USER

# Baseline for determining compute power on a machine is by calculating pi out to 1000 digits
time echo "scale=1000; 4*a(1)" | bc -l

# Get the whole DOM without getting flagged as a crawler
google-chrome --headless --dump-dom 'http://www.yahoo.com'

# Empty the trash from the command line since you let all your drive space get eaten up
rm -rf ~/.local/share/Trash/*

# Figure out your disks situation 
sudo fdisk -l

# Unmount a disk where mmcblk0 is the disk
sudo umount /dev/mmcblk0

# Copy sd card as an image with dd where mmcblk0 is the disk
sudo dd if=/dev/mmcblk0 of=~/sd-card-copy.img bs=1M status=progress

# Copy image to sd card with dd where mmcblk0 is the disk
sudo dd if=~/sd-card-copy.img of=/dev/mmcblk0 bs=1M status=progress