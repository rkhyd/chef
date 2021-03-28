## install multiple packages
myuserlist = ['tree','vim','ntp']
myuserlist.each do |item|
    package item do
        action :install
    end
end
