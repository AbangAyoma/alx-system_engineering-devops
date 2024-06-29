# my comment

file { '/tmp/school':
  ensure  => 'file',            # Ensure it's a regular file
  content => 'I love Puppet',   # Content of the file
  mode    => '0744',            # File permissions
  owner   => 'www-data',        # File owner
  group   => 'www-data',        # File group
}
