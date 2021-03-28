directory '/home/ravikumar/devops/data' do
    action :create
end

file '/home/ravikumar/devops/data/sample.txt' do
    mode '0700'
    owner 'ravikumar'
    group 'ravikumar'
    content 'This file cannot be read by humans'
end
