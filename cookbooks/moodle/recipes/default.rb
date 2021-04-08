#
# Cookbook:: moodle
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
execute "update-upgrade" do
    command "sudo apt-get update && sudo apt upgrade -y"
    action :run
  end
