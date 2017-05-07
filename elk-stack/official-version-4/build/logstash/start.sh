#!/bin/ash

cd /home/logstash

CFG_PATH="conf/"$(ls -t conf | grep .conf | sed -n '1p')

if [ -z $CFG_PATH ]; then
  	CFG_PATH="logstash_default.conf"
fi

echo "Starting logstash [cfg_path = $CFG_PATH]" 
logstash -f $CFG_PATH
