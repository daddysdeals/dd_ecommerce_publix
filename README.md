To make a development environment:
==================================
- Setup a drupalPro environment 
  - https://docs.google.com/a/perceptum.za.net/folder/d/0B1BmCT4HlfrzMDctQktTYUZjcVk/edit
- Tricky part sort out PHP nesting errors:
  - comment out the sendmail_path setting (in both /etc/php5/cli/php.ini and /etc/php5/apache2/php.ini) so that the default is used (notice the ";" at the beginning of the line)
    - ; sendmail_path = /home/drupalpro/websites/config/sendmail.php
  - increase php limit (64 default) to 512M
  - add the line: max_input_nesting_level=500 to the php.ini configuration files (both /etc/php5/cli/php.ini and /etc/php5/apache2/php.ini)
  - increase xdebug limit (100 default) only if you use Xdebug
    - add the line: xdebug.max_nesting_level=500 to the configuration file : /etc/php5/apache2/conf.d/xdebug.ini
- Start up drupalPro instance, and run all of the following commands from a console (press f4)
- First we install a localmailer that will send via mailtrap.io
  - wget https://raw.github.com/perceptum/dd_ecommerce_publix/master/make-mailtrap.sh -q -O- | bash
  - NOTES:
    - When prompted choose "Internet with smarthost"
    - System mail name: quickstart
    - SMTP relay host (blank for none) enter hostname:port: mailtrap.io:2525
- Now we get the Drupal Make scripts
  - wget https://raw.github.com/perceptum/dd_ecommerce_publix/master/drushmake.sh -q -O- | bash <platform name>
- Alternatively, if running on a system using quickstart, run the following 
  - wget https://raw.github.com/perceptum/dd_ecommerce_publix/master/make.sh -q -O- | bash


