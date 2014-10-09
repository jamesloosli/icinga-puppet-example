class baseicinga::server::services {
  ::icinga::resource { 'basic_system_service':
    type => 'service',
    icinga_config => {
      register              => '0',
      max_check_attempts    => '5',
      check_interval        => '1',
      retry_interval        => '1',
      check_period          => '24x7',
      notification_period   => '24x7',
      notification_interval => '0',
    }
  }
}
