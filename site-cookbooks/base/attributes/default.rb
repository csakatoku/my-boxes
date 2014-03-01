#
# Cookbook Name:: base
# Attributes:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

default['authorization']['sudo']['sudoers_defaults'] = [
  'env_reset',
  'secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"'
]
default['authorization']['sudo']['groups'] = ['sudo']
default['authorization']['sudo']['include_sudoers_d'] = true
