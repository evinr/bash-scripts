#! /bin/bash

#https://askubuntu.com/questions/652431/running-bash-script-at-login
# to run everytime at login, add the wget line of code below with your own NASA API Key
# for all users at login: /etc/profile
# for one user at login: .profile
# errors: ~/.xsession-errors
# to run each new terminal: /etc/bash.bashrc or .bashrc

wget $(curl https://api.nasa.gov/planetary/apod?api_key=<your-api-key> -H "Accept: application/json" -i | grep -oP 'https://.*?\.jpg' | head -n1) --output-document=/home/<your-user-name>/lock-background.jpg 
