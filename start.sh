#!/bin/bash 

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

function usage() {
	echo 'Every option can be set by using ENV variables or command parameters. Allowed options'
    echo '$MODE or -m allows to set mode of container [eg. prod]'
	echo '$SERVICE_NAME or -s allows to set service name [eg. authService]'
    echo '$ETCD_ADDR [eg. http://127.0.0.2:1500, 192.168.77.55:1500] - allows to set etcd cluster nodes'
    exit 1
}

if [ -z "$MODE" ]
then
    #Default application mode DEV
    export MODE="dev"
fi


while getopts ":s:n:m:h" OPTION; do
    case $OPTION in
        s)
    		export SERVICE_NAME="$OPTARG"
            ;;
        n)
			export ETCD_ADDR="$OPTARG"
            ;;
        m)
			export MODE="$OPTARG"
            ;;
        h)
            usage
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

if [ -z "$SERVICE_NAME" ]
then
    usage
fi


if [ -z "$ETCD_ADDR" ]
then
    usage
fi

# Dynamically put ETCD nodes in confd.config based on enviroment variable
nodes=$(echo "\"$ETCD_ADDR\"" | sed 's/\//\\\//g' | sed s/,./\",\"/g)
sed -i "s/.*nodes=.*/nodes=[$nodes]/" /etc/confd/confd.toml

echo -e "---- Trying to load config for" ${CYAN}$MODE"/"$SERVICE_NAME ${NC}" ----"
confd -onetime -prefix=$MODE"/"$SERVICE_NAME

tail -f /dev/null