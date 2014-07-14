#
# Cookbook Name:: site-cookbooks/kn_deployer
# Recipe:: default
#
# Copyright (C) 2014, Cuck FD
#
# All rights reserved - Do Not Redistribute
#

log "Installing and configuring Memcached"

package "memcached" do
  action :install
end

ruby_block "update memcached memory size" do
  block do
    file = Chef::Util::FileEdit.new("/etc/memcached.conf")
    file.search_file_replace_line(/^-m\s[0-9]+$/, "-m 8192")
    file.write_file
  end
end

service "memcached" do
  action :restart
end


log "Memcached installed and configured"
