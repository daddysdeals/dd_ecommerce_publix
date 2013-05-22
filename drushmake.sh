#!/bin/bash
if [ -z "$1" ];
then
	echo "ERROR expects at least 1 argument : ./drushmake.sh <new platform name>"

else
	echo "Downloading make file"
	URL="https://raw.github.com/perceptum/dd_ecommerce_publix/master/dd-dev.v.0.1.make"
	wget $URL -v -O /tmp/dd-dev.make
	echo "building new platform at $1"
	drush make /tmp/dd-dev.make $1 
	echo "Cleaning up ..."
	rm /tmp/dd-dev.make
	echo "done"
fi
