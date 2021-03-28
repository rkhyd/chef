## Install two packages and modify the motd file
package 'tree' do
    action :install
end

## If no action is specified, a default action for specified resource 
## is applied automatically
package 'ntp' 

file '/etc/motd' do
    content 'This message was generated from chef recipe...'
end

service 'ntp' do
    action [:enable,:start]
end
