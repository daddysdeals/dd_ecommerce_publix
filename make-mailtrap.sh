#!/bin/bash
sudo dpkg --purge postfix mailutils
sudo apt-get update
sudo apt-get install postfix mailutils

sudo /etc/init.d/postfix stop

PF=`cat /etc/postfix/main.cf | grep sasl_passwd`

if [ -z "$PF" ]; then
	 echo smtp_sasl_auth_enable = yes | sudo tee -a /etc/postfix/main.cf
	 echo smtp_sasl_mechanism_filter = plain | sudo tee -a /etc/postfix/main.cf
	 echo smtp_sasl_security_options = noanonymous | sudo tee -a /etc/postfix/main.cf
	 echo smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd | sudo tee -a /etc/postfix/main.cf
fi

echo "mailtrap.io localdev-3436c605e37cc25e:82661e54bea5d52f" | sudo tee /etc/postfix/sasl_passwd

sudo postmap /etc/postfix/sasl_passwd
sudo /etc/init.d/postfix start
