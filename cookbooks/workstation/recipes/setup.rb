## Install two packages and modify the motd file
package 'tree' do
    action :install
end

## If no action is specified, a default action for specified resource 
## is applied automatically
package 'ntp' 
package 'git'

##use node object to get ohai information
#node['ipadress']
#node['memory']['total']

## print 'I have 4 apples'
apple_count = 4
puts "I have #{apple_count} apples"

##get ohai information into the motd file
file '/etc/motd' do
    content "This message was generated from chef recipe...
    HOSTNAME: #{node['hostname']}
    IPADDRESS: #{node['ipaddress']}
    CPU: #{node['cpu']['0']['mhz']}
    MEMORY: #{node['memory']['total']}
"
    owner 'root'
    group 'root'
    action :create
end

service 'ntp' do
    action [:enable,:start]
end
