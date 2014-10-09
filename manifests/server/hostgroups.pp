class baseicinga::server::hostgroups {
#HostGroups
  ::icinga::resource { 'webservers' :
    type          => 'hostgroup',
  }
  ::icinga::resource { 'mailservers' :
    type          => 'hostgroup',
  }
  ::icinga::resource { 'databases' :
    type          => 'hostgroup',
  }
}
