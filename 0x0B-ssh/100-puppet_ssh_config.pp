# Puppet manifest to configure SSH client

#file { '/home/root/.ssh':
  #ensure  => directory,
  #owner   => 'your_username',
  #group   => 'your_username',
 # mode    => '0700',
#}
#
#file { '/home/root/.ssh/config':
#  ensure  => file,
#  owner   => 'root',
#  group   => 'root',
#  mode    => '0600',
# content => template('ssh/ssh_config.erb'),
#}
# Seting up my client config file
include stdlib

file_line { 'Turn off passwd auth':
  path => '/etc/ssh/ssh_config',
  line => 'PasswordAuthentication no',
}

file_line { 'Delare identity file':
  path => '/etc/ssh/ssh_config',
  line => 'IdentityFile ~/.ssh/school',
}
