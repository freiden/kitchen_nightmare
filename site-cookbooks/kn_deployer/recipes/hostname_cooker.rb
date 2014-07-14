#
# Cookbook Name:: site-cookbooks/kn_deployer
# Recipe:: default
#
# Copyright (C) 2014, Cuck FD
#
# All rights reserved - Do Not Redistribute
#

log "Changing server hostname..."

node.default['set_fqdn'] = node['server_ingredients']['hostname']
include_recipe 'hostname'

log "Server hostname has been changed!"
