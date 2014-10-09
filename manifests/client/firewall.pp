class baseicinga::client::firewall {
  firewall { '110 INPUT allow nrpe':
      chain   => 'INPUT',
      action  => accept,
      port    => 5666,
      state   => 'NEW',
  }  
}
