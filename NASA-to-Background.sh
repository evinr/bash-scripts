#! /bin/bash

# The goal of this script is to automatically save the NASA APOD to a lock/background.
# get your own NASA API Key: https://api.nasa.gov/

# To install
    # for all users at login: /etc/profile
    # for one user at login: .profile
    
# Errors can be found: ~/.xsession-errors

# To run when new terminal is launched: /etc/bash.bashrc or .bashrc

# After running the command once

# Open this file  /usr/share/gnome-shell/theme/ubuntu.css  

# to change the lock screen, edit these lines: #lockDialogGroup {
#  background: #2c001e url(file:////home/<user-name>/lock-background.jpg);
#  background-repeat: no-repeat;
#  background-size: cover;
#  background-position: center; }

# To change the background: 
# gsettings set org.gnome.desktop.background picture-uri "/home/<your-user-name>/lock-background.jpg"



wget $(curl https://api.nasa.gov/planetary/apod?api_key=<your-api-key> -H "Accept: application/json" -i | grep -oP 'https://.*?\.jpg' | head -n1) --output-document=/home/<your-user-name>/lock-background.jpg 
