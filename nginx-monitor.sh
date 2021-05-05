#! /bin/bash

# something was causing nginx to crash, this is the easiest way to ensure the process would not get stuck

# +1 extensibility
LOCAL_WEBSERVER_URL='http://127.0.0.1/nginx_status'

#checks nginx locally
curl -s $LOCAL_WEBSERVER_URL

# $? shows the exit code of the last command, if the curl is successful then the exit code will be 0
if [[ $? -gt 0 ]]
then
    # kick the server hard 
    sudo service nginx restart
fi
