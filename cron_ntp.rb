## stop and disable cron service
service 'cron' do
##    action [:stop,:disable]
    action [:start,:enable]
end
## package ntp 
package 'ntp' do 
:install
end

service 'ntp' do 
action [:start,:enable]
end
