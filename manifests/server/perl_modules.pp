class baseicinga::server::perl_modules {
  $perl_mods = [
    'Mail::Sendmail',
  ]

  package {$perl_mods:
    ensure   => present,
    provider => cpanm,
  }

  $perl_deps = [
    'rrdtool',
    'librrds-perl',
  ]
  
  package {$perl_deps:
    ensure => present,
  }
}
