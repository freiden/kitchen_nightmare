#
# Cookbook Name:: site-cookbooks/kn_deployer
# Recipe:: default
#
# Copyright (C) 2014, Cuck FD
#
# All rights reserved - Do Not Redistribute
#

log "Installing and configuring database server: 'MySQL'..."

log "Installing MySQL database..."
db_infos = data_bag_item('database', 'mysql')
db_root_infos = db_infos['accounts']['root']
db_repl_infos = db_infos['accounts']['repl']
db_debian_infos = db_infos['accounts']['debian']
db_bckp_infos = db_infos['accounts']['backup']

log "Configuring users accounts..."
node.default['mysql']['server_root_password']   = db_root_infos['password']
node.default['mysql']['server_debian_password'] = db_debian_infos['password']
node.default['mysql']['server_repl_password']   = db_repl_infos['password']
node.default['mysql']['remove_anonymous_users'] = true
node.default['mysql']['remove_test_database']   = true

node.default['mysql']['tunable']['innodb_buffer_pool_size'] = '1G'

node.override['build-essential']['compiletime'] = true

include_recipe "build-essential"

%w(build-essential mysql-client libmysqlclient-dev).each do |pack|
  package pack do
    action :nothing
  end.run_action(:install)
end
include_recipe "mysql::server"
include_recipe "mysql::ruby"
include_recipe "database::mysql"

mysql_connection_info = {
  host: "localhost",
  username: 'root',
  password: db_root_infos['password']
}

mysql_database_user 'backup' do
  connection mysql_connection_info
  password db_bckp_infos['password']
  action :create
end

mysql_database_user 'backup' do
  connection mysql_connection_info
  action :grant
  privileges ['select', 'lock tables']
end

bash "Setting MySQL time zones..." do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root mysql -p#{db_root_infos['password']}
  EOH
end

service "mysql" do
  action :restart
end

log "Database setted and configured."
