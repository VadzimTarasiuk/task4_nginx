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


service 'nginx' do
  action [ :enable, :start ]
end