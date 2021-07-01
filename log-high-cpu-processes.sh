#! /bin/bash

# this was adapted from here:

# There was an issue with the webserver that was hard to track down, this was the easiest solution

# check if CPU is more than idle to prevent log file from blowing up
* * * * * (echo "/%CPU /%MEM ARGS $(date)" && ps -e -o pcpu,pmem,args --sort=pcpu> | tail >> /home/ubuntu/high-cpu-ps-dump.log
