# installing flask version 2.1.0

package {'flask':    # installing flask
  ensure   => '2.1.0',  # making sure the version install is 2.1.0
  provider => 'pip3',
}
package {'werkzeug':
  ensure   => '2.1.1',
  provider => 'pip3',
}
