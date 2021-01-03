#!/bin/bash


SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd $SCRIPTPATH


value="{API_FQDN}"



if [ -e .API_FQDN.conf ]
then
    value=`cat .API_FQDN.conf` 
fi



if [ "$1" == "" ]
then
	echo "No domain was provided. Usage: ./setAPI_FQDN.sh DOMAIN_OF_API_HOST_OR_IP"
else
	echo "$value" > .API_FQDN.conf
    grep -rl "$value" . --exclude-dir=node_modules --exclude=*setAPI_FQDN.sh | xargs sed -i "s/$value/$1/g"
    echo "[!] Done"
fi