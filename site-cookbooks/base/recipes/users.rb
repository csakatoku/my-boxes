#
# Cookbook Name:: base
# Recipe:: users
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'sudo'

data_bag('users').each do |name|
  bag = data_bag_item('users', name)

  user name do
    uid bag['uid']
    shell bag['shell']
    supports :manage_home => true
  end

  home = "/home/#{name}"
  directory home do
    owner name
    mode 0755
  end

  directory "#{home}/.ssh" do
    owner name
    mode 0700
  end

  if bag['ssh_authorized_keys']
    file "#{home}/.ssh/authorized_keys" do
      content bag['ssh_authorized_keys'].join('\n')
      owner name
      mode 0600
      action :create
    end
  else
    file "#{home}/.ssh/authorized_keys" do
      action :delete
    end
  end

  if bag['sudo']
    sudo name do
      user bag['sudo']['user']
      nopasswd bag['sudo']['nopasswd']
    end
  end
end
