class profiles::gitlabprofile {

  class { 'gitlab':
    package_ensure => '9.1.3-ce.0.el7',
  }

}

