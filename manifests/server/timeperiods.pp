class baseicinga::server::timeperiods {
#TimePeriods
  ::icinga::resource { 'all_day' :
    type => 'timeperiod',
    icinga_config => {
      timeperiod_name => '24x7',
      sunday  => '00:00-24:00',
      monday  => '00:00-24:00',
      tuesday  => '00:00-24:00',
      wednesday  => '00:00-24:00',
      thursday  => '00:00-24:00',
      friday  => '00:00-24:00',
      sunday  => '00:00-24:00',
    },
  }
}
