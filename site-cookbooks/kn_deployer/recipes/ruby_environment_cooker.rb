#
# Cookbook Name:: site-cookbooks/kn_deployer
# Recipe:: default
#
# Copyright (C) 2014, Cuck FD
#
# All rights reserved - Do Not Redistribute
#

# encoding: utf-8

log "Updating system ruby to #{node[:server_ingredients][:default_ruby_version]}..."

bash "Updating system ruby version..." do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  rbenv shell system
  wget http://ftp.ruby-lang.org/pub/ruby/ruby-#{node[:server_ingredients][:default_ruby_version]}.tar.gz
  tar -xvzf ruby-#{node[:server_ingredients][:default_ruby_version]}.tar.gz
  cd ruby-#{node[:server_ingredients][:default_ruby_version]}
  ./configure --prefix=/usr/local
  make
  make install
  EOH
end

ohai 'reload' do
  action :reload
end

log "System ruby installed."

log "Setting Production Ruby environment..."

node.default['rbenv']['global'] = node[:server_ingredients][:default_ruby_version]
node.default['rbenv']['rubies'] = node[:server_ingredients][:rubies] || node[:server_ingredients][:default_ruby_version]

include_recipe "rbenv::system"


group "rbenv" do
  action :create
  members [
    node[:server_ingredients][:webapp_maintainer],
    node[:server_ingredients][:server_maintainer]
  ]
  append true
end

user "rbenv" do
  comment "Rbenv default user"
  gid "rbenv"
end

rbenv_rehash "Doing the rehash... ಠ_ಠ"
rbenv_global node[:server_ingredients][:default_ruby_version]

node['rbenv']['rubies'].each do |rb_version|
  rbenv_script "Update rubygems" do
    rbenv_version rb_version
    code "gem update --system && gem install rake --force"
  end
  %w(bundler hirb awesome_print pry brice looksee rack).each do |rgem|
    rbenv_gem rgem do
      rbenv_version rb_version
    end
  end
end

node.default['passenger']['rbenv_ruby_version'] = node[:server_ingredients][:default_ruby_version]
node.default['passenger']['version'] = node[:server_ingredients][:passenger_version]
node.default['passenger']['max_pool_size'] = 12
node.default['passenger']['rbenv_root_path'] = node[:server_ingredients][:rbenv_root_path]
node.default['passenger']['root_path'] = node[:server_ingredients][:passenger_root_path]
node.default['passenger']['ruby_bin'] = "#{node[:server_ingredients][:rbenv_root_path]}/shims/ruby"

node.override['passenger']['module_path'] = "#{node['passenger']['root_path']}/buildout/apache2/mod_passenger.so"

include_recipe "passenger_apache2::mod_rails"

bash "update rbenv directory rights" do
  user 'root'
  cwd '/usr/local/rbenv'
  code <<-EOH
    umask 0002
    chmod -R 775 .
    chown -R rbenv:rbenv .
    chmod -R g+s .
    chgrp -R rbenv .
  EOH
end

log "Create symlink to rbenv into deployer account..."
link "/home/#{node[:server_ingredients][:webapp_maintainer]}/.rbenv" do
  to "#{node[:server_ingredients][:rbenv_root_path]}"
end
log "Symlink created."

rbenv_rehash %Q(Doing the rehash dance ('°o°)' '(°o°'))

log "Production Ruby environment installed."
