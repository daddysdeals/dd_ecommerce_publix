To make a development environment:
==================================
- First we install a localmailer that will send via mailtrap.io
  - wget https://raw.github.com/perceptum/dd_ecommerce_publix/master/make-mailtrap.sh -q -O- | bash
  - NOTES:
    - When prompted choose "Internet with smarthost"
    - System mail name: quickstart
    - SMTP relay host (blank for none) enter hostname:port: mailtrap.io:2525
- Setup a drupalPro environment (https://docs.google.com/a/perceptum.za.net/folder/d/0B1BmCT4HlfrzMDctQktTYUZjcVk/edit)
- From the console (press f4 once booted and logged in) run:
  - wget https://raw.github.com/perceptum/dd_ecommerce_publix/master/make.sh -q -O- | bash

If you are getting nesting errors:
* increase php limit (64 default) to 512M
* add the line : max_input_nesting_level=500 to the php.ini configuration file (usually /etc/php5/apache2/php.ini)
* increase xdebug limit (100 default) only if you use Xdebug
  * add the line : xdebug.max_nesting_level=500 to the configuration file : /etc/php5/apache2/conf.d/xdebug.ini

