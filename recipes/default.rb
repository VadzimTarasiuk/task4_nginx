#
# Cookbook:: task4_nginx
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#NGINX installation
package 'nginx' do
  action :install
end

package 'net-tools' do
  action :install
end

#Nginx Configuration
lb 'default' do
  role 'apache_server'
  action :attach
end

template '/etc/nginx/nginx.conf' do
  source 'nginx.conf.erb'
  mode '0755'
end

template '/etc/nginx/conf.d/upstreams.conf' do
  source 'upstreams.conf.erb'
  mode '0755'
end

service 'nginx' do
  action [ :enable, :start ]
end