#
# Cookbook Name:: site-cookbooks/kn_deployer
# Recipe:: default
#
# Copyright (C) 2014, Cuck FD
#
# All rights reserved - Do Not Redistribute
#

log "Installing Apache2..."

# node.default['apache']['listen_ports'] = [8080]

include_recipe 'apache2'

log "Installing Apache2 usefull modules..."
### Install Apache2 Modules
%w(xsendfile  proxy_http rewrite proxy expires headers proxy_balancer).each do |amod|
  include_recipe "apache2::mod_#{amod}"
  apache_module amod
end

log "Installing modules without recipes..."
remote_file "/tmp/mod-pagespeed-beta_current_amd64.deb" do
  source "https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-beta_current_amd64.deb"
  owner 'root'
  group 'root'
  mode 00644
end

remote_file "/tmp/mod-spdy-beta_current_amd64.deb" do
  source "https://dl-ssl.google.com/dl/linux/direct/mod-spdy-beta_current_amd64.deb"
  owner 'root'
  group 'root'
  mode 00644
end


bash "Installing and configuring mod-pagespeed and mod-spdy" do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  dpkg -i mod-pagespeed-*.deb
  dpkg -i mod-spdy-*.deb
  apt-get -f install
  echo "Configuring cache directory"
  mkdir -p /var/cache/mod_pagespeed
  chown -R www-data:www-data /var/cache/mod_pagespeed
  EOH
end
log "Installed modules without recipes"

log "Configuring Apache2..."

# Set apache2.conf
template "/etc/apache2/apache2.conf" do
  source "apache2.conf.erb"
  owner "root"
  group "root"
  mode 00644
end

# Usefull only if script fail to restart Apache2 without virtualhost
# bash "Setting Default ServerName" do
#   user "root"
#   cwd "/etc/apache2/conf.d"
#   code <<-EOH
#   echo "ServerName localhost" > name
#   EOH
# end

# Set ports.conf
template "/etc/apache2/ports.conf" do
  source "ports.conf.erb"
  owner "root"
  group "root"
  mode 00644
  variables(original_ip: node[:server_ingredients][:original_ip])
  not_if { "FIXME" == node[:server_ingredients][:original_ip] }
end

web_app "000-unsolicited-domains-shield" do
  template "unsolicited-domains-shield.conf.erb"
end


log "Apache2 installed and configured."
