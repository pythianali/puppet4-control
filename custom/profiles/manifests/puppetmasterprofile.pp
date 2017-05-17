class profiles::puppetmasterprofile {
  
  include git

  file { "/opt/puppetlabs/server/data/puppetserver/.ssh":
    ensure            =>  directory,
    owner             =>  puppet,
    group             =>  puppet,
    mode              =>  '0744',
  }

  $sshkeys = lookup('sshkeys')

  unless empty($sshkeys) {
    create_resources('file', $sshkeys)
  }

  $puppetsshconfig = lookup('puppetsshconfig')

  unless empty($puppetsshconfig) {
    create_resources('file', $puppetsshconfig)
  }

  file { "/root/.ssh":
    ensure            =>  directory,
    owner             =>  root,
    group             =>  root,
    mode              =>  '0744',
  }


  sshkey {'gitlab.example.com':
    ensure => present,
    type   => 'ssh-rsa',
    target => '/root/.ssh/known_hosts',
    key => 'key here'
  }

}

