# Puppet manifest to configure SSH client

file { '/home/root/.ssh':
  ensure  => directory,
  owner   => 'your_username',
  group   => 'your_username',
  mode    => '0700',
}

file { '/home/root/.ssh/config':
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  mode    => '0600',
  content => template('ssh/ssh_config.erb'),
}

