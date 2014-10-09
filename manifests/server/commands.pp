class baseicinga::server::commands {
  ::icinga::resource { 'host-notify-by-email-html' :
    type          => 'command',
    icinga_config => {
      command_name => 'host-notify-by-email-html',
      command_line => '/usr/bin/printf "%b" "***** Nagios 2.9 *****\n\nNotification Type: $NOTIFICATIONTYPE$\nHost: $HOSTNAME$\nState: $HOSTSTATE$\nAddress: $HOSTADDRESS$\nInfo: $HOSTOUTPUT$\n\nDate/Time: $LONGDATETIME$\n" | /bin/mail -s "Host $HOSTSTATE$ alert for $HOSTNAME$!" $CONTACTEMAIL$',
    },
  }
  ::icinga::resource { 'service-notify-by-email-html' :
    type          => 'command',
    icinga_config => {
      command_name => 'service-notify-by-email-html',
      command_line => '/usr/bin/printf "%b" "***** Nagios 2.9 *****\n\nNotification Type: $NOTIFICATIONTYPE$\n\nService: $SERVICEDESC$\nHost: $HOSTALIAS$\nAddress: $HOSTADDRESS$\nState: $SERVICESTATE$\n\nDate/Time: $LONGDATETIME$\n\nAdditional Info:\n\n$SERVICEOUTPUT$" | /bin/mail -s "** $NOTIFICATIONTYPE$ alert - $HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$ **" $CONTACTEMAIL$',
    },
  }

  file { '/usr/lib/icinga/pnp4n_send_host_mail.pl' :
    source => 'puppet:///modules/baseicinga/lib/pnp4n_send_host_mail.pl',
    mode   => 0777,
  }
  file { '/usr/lib/icinga/pnp4n_send_service_mail.pl' :
    source => 'puppet:///modules/baseicinga/lib/pnp4n_send_service_mail.pl',
    mode   => 0777,
  }
  file { '/usr/lib/icinga/nagios_send_host_mail.pl' :
    source => 'puppet:///modules/baseicinga/lib/nagios_send_host_mail.pl',
    mode   => 0777,
  }
  file { '/usr/lib/icinga/nagios_send_service_mail.pl' :
    source => 'puppet:///modules/baseicinga/lib/nagios_send_service_mail.pl',
    mode   => 0777,
  }

  ::icinga::resource { 'host-notify-by-email' :
    type          => 'command',
    icinga_config => {
      command_name => 'host-notify-by-email',
      command_line => '/usr/bin/printf "%b" "***** Nagios 2.9 *****\n\nNotification Type: $NOTIFICATIONTYPE$\nHost: $HOSTNAME$\nState: $HOSTSTATE$\nAddress: $HOSTADDRESS$\nInfo: $HOSTOUTPUT$\n\nDate/Time: $LONGDATETIME$\n" | /bin/mail -s "Host $HOSTSTATE$ alert for $HOSTNAME$!" $CONTACTEMAIL$',
    },
  }
  ::icinga::resource { 'service-notify-by-email' :
    type          => 'command',
    icinga_config => {
      command_name => 'service-notify-by-email',
      command_line => '/usr/bin/printf "%b" "***** Nagios 2.9 *****\n\nNotification Type: $NOTIFICATIONTYPE$\n\nService: $SERVICEDESC$\nHost: $HOSTALIAS$\nAddress: $HOSTADDRESS$\nState: $SERVICESTATE$\n\nDate/Time: $LONGDATETIME$\n\nAdditional Info:\n\n$SERVICEOUTPUT$" | /bin/mail -s "** $NOTIFICATIONTYPE$ alert - $HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$ **" $CONTACTEMAIL$',
    },
  }
  ::icinga::resource { 'nrpe_check_disks' :
    type          => 'command',
    icinga_config => {
      command_name => 'nrpe_check_disks',
      command_line => '/usr/lib/nagios/plugins/check_nrpe -H $HOSTADDRESS$ -c check_disk',
    }
  }
  ::icinga::resource { 'nrpe_check_memory' :
    type          => 'command',
    icinga_config => {
      command_name => 'nrpe_check_memory',
      command_line => '/usr/lib/nagios/plugins/check_nrpe -H $HOSTADDRESS$ -c check_mem',
    }
  }

  ::icinga::resource { 'nrpe_check_ip_monster' :
    type          => 'command',
    icinga_config => {
      command_name => 'nrpe_check_ip_monster',
      command_line => '/usr/lib/nagios/plugins/check_nrpe -H $HOSTADDRESS$ -c check_ip_monster',
    }
  }

  ::icinga::resource { 'nrpe_check_ip_check' :
    type          => 'command',
    icinga_config => {
      command_name => 'nrpe_check_ip_check',
      command_line => '/usr/lib/nagios/plugins/check_nrpe -H $HOSTADDRESS$ -c check_ip_check',
    }
  }

}
