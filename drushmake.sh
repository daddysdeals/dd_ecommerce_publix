#!/bin/bash


if [ -z "$1" ];
then
	echo "ERROR expects at least 1 argument : ./drushmake.sh <new platform name>"
	exit 255
fi

PLATFORM=$1
PLATFORM_CONTEXT=@platform_$1
AEGIR_ROOT=/var/aegir/platforms
PLATFORM_ROOT=$AEGIR_ROOT/$PLATFORM
MAKEFILE_URL="https://raw.github.com/perceptum/dd_ecommerce_publix/master/dd-dev.v.0.1.make"
MAKE_FILE_DL=/tmp/dd-dev.`date +%s`.make

if [ ! -d "$AEGIR_ROOT" ]; then
	echo "Aegir root $AEGIR_ROOT not found"
	exit 253
fi

if [ -d "$PLATFORM_ROOT" ]; then
 	echo "A platform with this name $PLATFORM already exists at $PLATFORM_ROOT"
	exit 254
fi

echo "Creating Drush context for the new site [$PLATFORM_CONTEXT]"

rm -f $MAKE_FILE_DL

echo "Downloading make file"
wget $MAKEFILE_URL -v -O $MAKE_FILE_DL
if [ ! -f "$MAKE_FILE_DL" ]; then
  echo "$MAKEFILE_URL could not be downloaded"
fi;

echo "building new platform at $PLATFORM_ROOT"
drush make $MAKE_FILE_DL $PLATFORM_ROOT

echo "Creating Drush context for the new site [$PLATFORM_CONTEXT]"
drush --root="$PLATFORM_ROOT" provision-save "$PLATFORM_CONTEXT" --context_type='platform'

echo "Hosting import running"
drush @hostmaster hosting-import "$PLATFORM_CONTEXT"

echo "Hosting dispatch running"
drush @hostmaster hosting-dispatch

echo "Cleaning up ..."
rm -f $MAKE_FILE_DL
echo "done"
