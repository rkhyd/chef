# Create multiple groups
myuserlist = ['accountant','developer','hr']
myuserlist.each do |item|
    group item do
        action :create
    end
end

#### output: https://i.imgur.com/oeRckgN.png
### task: add user to multiple groups