#!/bin/bash
URL="https://raw.github.com/perceptum/dd_ecommerce_publix/master/dd-dev.v.0.1.make"
wget $URL -v -O /tmp/dd-dev.make
drush quickstart-create --domain=ddeals.dev --makefile=/tmp/dd-dev.make --profile=daddy_s_deals
rm /tmp/dd-dev.make
