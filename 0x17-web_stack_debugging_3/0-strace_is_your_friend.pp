# Fix 500 error in Apache web server using Puppet instead of Bash

exec {'replace':
  provider => shell,
  command  => 'sed -i "s/phpp/php/g" /var/www/html/wp-settings.php'
}
