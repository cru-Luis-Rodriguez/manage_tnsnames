#
# Cookbook Name:: manage_tnsnames
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
ora_home = node['psft']['oracle_client']['home']

template "#{ora_home}/network/admin/tnsnames.ora" do
    source 'tnsnames.erb'
    owner "tuxedo"
    group "tuxedo"
    mode 0755
    variables(
              :db_name => node['tns']['db_name'],
              :db_server => node['tns']['db_server'],
              :service => node['tns']['app_service']
              )
only_if { File.exist?("#{ora_home}/network/admin/tnsnames.ora") && "grep tuxedo /etc/passwd", :environment => { 'HOME' => "/home/tuxedo" }}
end

