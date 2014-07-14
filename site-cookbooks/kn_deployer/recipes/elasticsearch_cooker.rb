#
# Cookbook Name:: site-cookbooks/kn_deployer
# Recipe:: default
#
# Copyright (C) 2014, Cuck FD
#
# All rights reserved - Do Not Redistribute
#

log "Setting ElasticSearch for production..."

include_recipe "elasticsearch"

node.default['elasticsearch']['cluster_name'] = node['server_ingredients']['elasticsearch']['cluster_name']
node.default['elasticsearch']['bootstrap.mlockall'] = node['server_ingredients']['elasticsearch']['bootstrap.mlockall']

log "ElasticSearch installed and configured."
