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
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDFpXCnfblBvuMZxp8ZL9xTzBbiPl3POy9NiA3kU7w+ZnqUowoKjjKQNV6ePRssWiDX9ORQbN+PZ4pehrHlA1GZib2VOqgtDv7XXp2m1TD/d9cBKJDMkw64OpBdPB6OokVCsPvBC/c48yQfdq8Q5GxLXzX3YyqPMOa4J+crgwdNsUTEcIFUewKXGQ3uU4TAK+KqSLwlIoc2mjKH4H4o2l4+mUxWC2vFJjO/e8Hn3jDuqkh4pbT3paMjt7JsxtNJiP23YM+i4F5frVm80imuuKlpF+nl+onNRhBIVNoUoW0LRJnFPdZzc7MjsVwXiAF8nhtX8dALYoaRDY05FJEpxD83'
  }

}

