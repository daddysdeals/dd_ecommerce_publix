#!/bin/bash

MAKEFILE_URL="https://raw.github.com/perceptum/dd_ecommerce_publix/master/dd-dev.v.0.1.make"
MAKE_FILE_DL=/tmp/dd-dev.`date +%s`.make

rm -f $MAKE_FILE_DL

echo "Downloading make file"
wget $MAKEFILE_URL -v -O $MAKE_FILE_DL
if [ ! -f "$MAKE_FILE_DL" ]; then
  echo "$MAKEFILE_URL could not be downloaded"
fi;

echo "building new quickstart site"
drush quickstart-create --domain=ddeals.dev --makefile=$MAKE_FILE_DL --profile=daddy_s_deals

echo "Cleaning up ..."
rm -f $MAKE_FILE_DL
echo "done"
