class roles::puppetmasterrole {
  include profiles::r10kprofile
  include profiles::mcollectiveserverprofile
  include profiles::puppetmasterprofile
}

