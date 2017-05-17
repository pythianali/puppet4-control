class profiles::r10kprofile {
  class { 'r10k':
    sources => {
      'puppet' => {
        'remote'  => 'git@gitlab.example.com:root/puppet.git',
        'basedir' => "${::settings::codedir}/environments",
      },
    },
  }
  class { '::r10k::webhook::config':
    protected       => false,
    enable_ssl      => false,
    use_mcollective => false,
    notify          => Service['webhook'],
  }

  class { '::r10k::webhook':
    user    => 'root',
    group   => 'root',
    require => Class['::r10k::webhook::config'],
  }  

}

