#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
if platform_family?('gentoo')
  packages = %w{zsh git tmux net-misc/curl}
else
  packages = %w{zsh git tmux curl}
end

packages.each do |pkg|
  package pkg do
    action :install
  end
end
