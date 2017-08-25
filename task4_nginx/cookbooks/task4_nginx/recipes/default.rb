#
# Cookbook:: task4_nginx
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#NGINX installation
package 'nginx' do
  action :install
end

#Nginx Configuration
lb 'default' do
  role 'default-sbeliakou-centos-73-x86-64-minimal.vagrantup.com'
  action :attach
end

service 'nginx' do
  action [ :enable, :start ]
end