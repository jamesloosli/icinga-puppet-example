class baseicinga::client::nrpe_commands {
  $dir_nagios_plugins = "/usr/lib/nagios/plugins"
  ::icinga::client::resources::nrpe_check { "check_disk" :
    check => "${dir_nagios_plugins}/check_disk -w 15% -c 10% /",
  }

  ::icinga::client::resources::nrpe_check { "check_mem" :
    check => "${dir_nagios_plugins}/check_mem.pl -f -w 10 -c 2",
  }
  ::icinga::client::resources::plugin { "check_mem.pl" :
    plugin_source => 'puppet:///modules/baseicinga/plugins/check_mem.pl',
  }

  $warn5  = $::processorcount * 1.0
  $warn10 = $::processorcount * 0.7
  $warn15 = $::processorcount * 0.5
 
  $crit5  = $::processorcount * 2.0
  $crit10 = $::processorcount * 1.0
  $crit15 = $::processorcount * 0.9

  ::icinga::client::resources::nrpe_check { "check_load" :
    check => "${dir_nagios_plugins}/check_load -w ${warn5},${warn10},${warn15} -c ${crit5},${crit10},${crit15}",
  }

  ::icinga::client::resources::nrpe_check { "check_ip_monster" :
    check => "/usr/lib/nagios/plugins/check_procs -c 1:1 -C node -a /opt/ips/ip_monster.pl",
  }
  ::icinga::client::resources::nrpe_check { "check_ip_check" :
    check => "/usr/lib/nagios/plugins/check_procs -c 1:1 -C node -a /opt/ips/ip_check.pl",
  }

}
