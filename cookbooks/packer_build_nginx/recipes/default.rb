#
# Cookbook:: packer_build
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

apt_update 'default' if ubuntu_platform?

execute 'apply_updates' do
  command 'apt upgrade -y'
  action :run
end

package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :start, :enable ]
end

user 'someuser'

group 'somegroup' do
  members 'someuser'
end
