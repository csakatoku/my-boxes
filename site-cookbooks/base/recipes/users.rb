#
# Cookbook Name:: base
# Recipe:: users
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'sudo'

user 'csakatoku' do
  uid '2005'
  shell '/bin/bash'
  supports :manage_home => true
end

directory '/home/csakatoku' do
  owner 'csakatoku'
  mode 0755
end

directory '/home/csakatoku/.ssh' do
  owner 'csakatoku'
  mode 0700
end

file '/home/csakatoku/.ssh/authorized_keys' do
  content 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDVF97XH+gGz48EzrcmoBuqNo7KXNnz45y9brsQS2XzEA0BGum/TBNAB7lLnIspSVFbYuqXav9h0JvaTwa6Rc09NTd5f1gDUiW3XStCrOT+FaN4x7JwVIi6iaOEsBks+fJWxTdkdi5UhWXjlmodh0iFHtgeR+Ft/8XZ3h6ETB/M9hkqHrflB4G9LkpeyHmi313cNuN2x8r6+aJNkSTm1t6ymPjhBArEo9/qkoVH01C10j3XIqOJ+/GaDziAmQN972N8Fh9klhrgutZf27MVg5XGA2xx/NtqWDT+K9vMa1p1QrHH5mnUJjK5KX7QvC5wHcMBbzpTfVA27j6Se9IYBBiR5Bc0JHXIYPOZOl8p6PajERoS983UKiTTVwRB49cetNBZVWMRhbdN4Eg6snsqmsPNW0kadwZtIfCtACYaTv4PLjoS2xBiCh0t7PiynyDYElFJ0+Dr4BluEYcqDypyirzTevPpMI0lkNwfNlF1n7r1Enteww4mSwXNb/bzWd1TlkSeJsWWwAYuyqOBwlahjv8lz5L91cLNwVXD2ZxJM3WHnPOXXoYtXmcMnX+rQ2/NxHNtG9X0Yk8FAIfMRBPLtkaSxhgKyvvFBVyp+gTWWsODYZafmbQjFFJUSFi2o9F+wamRcmz/R1/4D75kQqmhvL7s8g1C7wXWvhKyZ1vJtYj1rQ=='
  owner 'csakatoku'
  mode 0600
end

sudo 'csakatoku' do
  user "%csakatoku"
  nopasswd true
end
