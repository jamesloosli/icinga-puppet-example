class baseicinga::server::contacts {
#Contacts
  ::icinga::resource { 'james' :
    type          => 'contact',
    icinga_config => {
      email => 'james@instantchannelinc.com',
      use   => 'contact_template',
      host_notifications_enabled => '0',
      service_notifications_enabled => '0',
    }
  }
  ::icinga::resource { 'dave' :
    type          => 'contact',
    icinga_config => {
      email => 'dave@instantchannelinc.com',
      use   => 'contact_template',
      host_notifications_enabled => '0',
      service_notifications_enabled => '0',
     }
  }
  ::icinga::resource { 'support' :
    type          => 'contact',
    icinga_config => {
      email => 'support@instantchannelinc.com',
      use   => 'contact_template',
      host_notifications_enabled => '1',
      service_notifications_enabled => '1',
     }
  }
  ::icinga::resource { 'contact_template' :
    type          => 'contact',
    icinga_config => {
      register => '0',
        service_notification_period   => '24x7',
        host_notification_period      => '24x7',
        service_notification_options  => 'w,u,c,r',
        host_notification_options     => 'd,u,r',
        service_notification_commands => 'service-notify-by-email',
        host_notification_commands    => 'host-notify-by-email',
    }
  }

#ContactGroups
  ::icinga::resource { 'humans' :
    type          => 'contactgroup',
    icinga_config => {
      members => 'james,dave',
    }
  }
  ::icinga::resource { 'computers' :
    type          => 'contactgroup',
    icinga_config => {
      members => 'support',
    }
  }
}
