#Install and enable Apache
package 'apache2' do
    action :install
end

file '/var/www/html/index.html' do
    action :delete
end

service 'apache2' do
    action [:enable,:start]
end

#Virtual Host Files
node["moodle"]["sites"].each do |sitename, data|
    document_root = "/var/www/html"

    directory "/var/www/html" do
        action :create
    end
    
    directory "/var/www/html/logs" do
        action :create
    end

    directory document_root do
        mode "0755"
        recursive true
    end

    execute "enable-sites" do
        command "a2ensite #{sitename}"
        action :nothing
      end

    template "/etc/apache2/sites-available/#{sitename}.conf" do
        source "virtualhosts.erb"
        mode "0644"
        variables(
          :document_root => document_root,
          :port => data["port"],
          :serveradmin => data["serveradmin"],
          :servername => data["servername"]
        )
        notifies :run, "execute[enable-sites]"
        notifies :restart, "service[apache2]"
    end

    execute "enable-prefork" do
        command "a2enmod mpm_prefork"
        action :nothing
    end
    
    cookbook_file "/etc/apache2/mods-available/mpm_prefork.conf" do
        source "mpm_prefork.conf"
        mode "0644"
        notifies :run, "execute[enable-prefork]"
    end

end