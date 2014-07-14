#
# Cookbook Name:: site-cookbooks/kn_deployer
# Recipe:: default
#
# Copyright (C) 2014, Cuck FD
#
# All rights reserved - Do Not Redistribute
#

log "Installing and configuring Nginx..."


node.override['nginx']['listening_port'] = 8090

# node.override['nginx']['version'] = node[:server_ingredients][:nginx_version] # FIXME: Management of nginx version doesn't work correctly for the moment due to ohai reload.

node.default['nginx']['passenger']['root'] = node['server_ingredients']['passenger_root_path']
node.default['nginx']['passenger']['ruby'] = "#{node['server_ingredients']['rbenv_shims']}/ruby"
node.default['nginx']['passenger']['ruby_version'] = node[:server_ingredients][:default_ruby_version]


nginx_required_modules = %w(nginx::http_gzip_static_module nginx::http_realip_module  nginx::http_stub_status_module  nginx::http_ssl_module)

nginx_complementary_modules = %w(nginx::passenger nginx::http_ngx_pagespeed_module nginx::http_spdy_module nginx::upload_progress_module)
# nginx_complementary_modules = %w(nginx::http_ngx_pagespeed_module nginx::http_spdy_module nginx::upload_progress_module)

# Modif
log "Installing required modules..."
nginx_complementary_modules.each do |complementary_module|
  if node.server_ingredients.nginx.modules.attribute?(complementary_module.gsub('nginx::', ''))
    nginx_required_modules << complementary_module
  end
end

# Modif

node.default['nginx']['source']['modules'] = nginx_required_modules
# node.default['nginx']['source']['modules'] = %w(nginx::passenger)
log "Installed required modules"

include_recipe "nginx::source"
include_recipe "nginx::http_spdy_module"
include_recipe "nginx::http_realip_module"
include_recipe "nginx::http_gzip_static_module"
include_recipe "nginx::http_ngx_pagespeed_module"
include_recipe "nginx::http_ssl_module"
include_recipe "nginx::upload_progress_module"
include_recipe "nginx::passenger"

log "Nginx installed and configured."
