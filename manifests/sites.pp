node 'puppet.example.com' {
  include roles::puppetmasterrole
}

node 'gitlab.example.com' {
  include roles::gitlabrole
}
