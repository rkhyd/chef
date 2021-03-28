group 'devops' do
    :create
end
    
user 'bhaavika' do
    ## set the password to password
      password '$1$daY/teO4$cLvIokdwchYc64bWQbClM0'
      uid '777'
      gid 'devops'
      shell '/bin/bash'
      home '/home/bhaavika'
end