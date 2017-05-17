#!/usr/bin/env python

## This script does the following:
##
## 1. Retrieves the host fqdn for any host with a role assigned in sites.pp 
##
## 2. Creates an external role fact based on some matching analysis against the hostname
##
## 3. Hosts without any match analysis condition will not have the fact applied

import socket
fqdn = socket.getfqdn()

#print(fqdn)

if fqdn[0:6] == "puppet":
  data = {"roles" : "puppetmasterrole"} 
elif fqdn[0:6] == "gitlab":
  data = {"roles" : "gitlabrrole"} 
else:
  data = {"roles" : ""} 

if data != "":
  for k in data:
      print "%s=%s" % (k,data[k])

