class baseicinga::client::basic_checks {
  @@::icinga::resource { $::hostname :
    type => 'host',
    icinga_config => {
        host_name             => $::fqdn,
        address               => $::ipaddress_main,
        check_command         => 'check-host-alive',
        check_interval        => '5',
        retry_interval        => '1',
        max_check_attempts    => '5',
        check_period          => '24x7',
        contact_groups        => 'computers',
        notification_interval => '30',
        notification_period   => '24x7',
        notification_options  => 'd,u,r',
    }
  }
#disk
  @@::icinga::resource { "$::hostname disk space" :
    type => 'service',
    icinga_config => {
      use                 => 'basic_system_service',
      service_description => 'disk space',
      host_name           => $::fqdn,
      check_command       => "nrpe_check_disks",
    }
  }
#memory
  @@::icinga::resource { "$::hostname memory" :
    type => 'service',
    icinga_config => {
      use                 => 'basic_system_service',
      service_description => 'memory',
      host_name           => $::fqdn,
      check_command       => "nrpe_check_memory",
    }
  }
}
