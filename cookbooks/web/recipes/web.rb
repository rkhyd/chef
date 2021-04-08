package 'apache2' do
    action :install
end

file '/var/www/html/index.html' do
    content '<h1>Hello World from Chef...</h1>'
end

service 'apache2' do
    action [:enable,:start]
end
welcome 
## Create a template resource
template '/var/www/html/index.html' do
    source 'index.html.erb'
    variables(
        fqdn: node['fqdn']
    )
    mode '0755'
    action :create
end