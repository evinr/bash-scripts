#! /bin/bash

# The goal of this script is to automatically save the NASA APOD to a lock/background as part of an installable package.

# wget $(curl https://api.nasa.gov/planetary/apod?api_key=$NASA_API_KEY -H "Accept: application/json" -is | grep -oP 'https://.*?\.jpg' | head -n1) --output-document=/usr/share/backgrounds/APOD.jpg 2>/dev/null
# not every user will implement the API and it is not needed since the URL is publically accessible

# when scraping the actual site we sometimes will get a bulky iframe
    # when no img and an iframe is detected
        # curl the iframe url
            # find the img tag
    # at the least do not let the .jpg get over written

touch /etc/network/if-up.d/NASA_APOD_scrapper
echo "wget $(echo "https://apod.nasa.gov/apod/""$(curl https://apod.nasa.gov/apod/astropix.html -is | grep -oP 'image.*?\.jpg' | head -n1 | sed 's/<a href="//' | tr -d ' ')") --output-document=/usr/share/backgrounds/APOD.jpg 2>/dev/null" > /etc/network/if-up.d/NASA_APOD_scrapper
chmod +x /etc/network/if-up.d/NASA_APOD_scrapper

#download todays image 
wget $(echo "https://apod.nasa.gov/apod/""$(curl https://apod.nasa.gov/apod/astropix.html -is | grep -oP 'image.*?\.jpg' | head -n1 | sed 's/<a href="//' | tr -d ' ')") --output-document=/usr/share/backgrounds/APOD.jpg 2>/dev/null

# To make the APOD a selectable background: /usr/share/gnome-background-properties/ubuntu-wallpapers.xml

# Replace the last instance/line with
#</wallpapers>
# TODO: Dont be this lazy
# deleting the last line
sed -i '$ d' /usr/share/gnome-background-properties/ubuntu-wallpapers.xml
# with this
echo '<wallpaper>\n<name>NASA APOD</name>\n<filename>/usr/share/backgrounds/APOD.jpg</filename>\n<options>zoom</options>\n<pcolor>#333333</pcolor>\n<scolor>#333333</scolor>\n<shade_type>solid</shade_type>\n</wallpaper>\n</wallpapers>' >> /usr/share/gnome-background-properties/ubuntu-wallpapers.xml

# this is the same as setting them in the control panel
gsettings set org.gnome.desktop.background picture-uri file:////usr/share/backgrounds/APOD.jpg
gsettings set org.gnome.desktop.screensaver picture-uri file:////usr/share/backgrounds/APOD.jpg

# gsettings range org.gnome.desktop.background picture-options
# TODO: check if you need to set the picture options beyond 'zoom'