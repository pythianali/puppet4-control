class profiles::mcollectiveserverprofile {

  class { '::activemq':
  }

  class { '::mcollective':
    middleware_hosts => [ 'puppet.example.com' ],
    client => true,
    core_libdir => '/usr/libexec/mcollective',
  }

  mcollective::plugin { ['puppet','service','package']:
    package => true,
  }

}
