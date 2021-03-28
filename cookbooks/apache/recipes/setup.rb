#
# Cookbook:: .
# Recipe:: setup
#
# Copyright:: 2021, The Authors, All Rights Reserved.
package 'apache2' do
    action :install
end

file '/var/www/html/index.html' do
    content '<h1>Hello World</h1>'
end

service 'apache2' do
    action [:enable,:start]
end