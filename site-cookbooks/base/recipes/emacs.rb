#
# Cookbook Name:: base
# Recipe:: emacs
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
if platform_family?('gentoo')
  pkg = 'app-editors/emacs'
else
  pkg = 'emacs24-nox'
end

package pkg do
  action :install
end
