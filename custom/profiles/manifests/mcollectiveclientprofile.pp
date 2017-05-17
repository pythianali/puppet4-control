class profiles::mcollectiveclientprofile {

  class { '::mcollective':
    middleware_hosts => [ 'puppet.example.com' ],
    client => true,
  }
 
}

