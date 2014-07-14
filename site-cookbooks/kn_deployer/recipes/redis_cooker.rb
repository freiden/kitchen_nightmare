#
# Cookbook Name:: site-cookbooks/kn_deployer
# Recipe:: default
#
# Copyright (C) 2014, Cuck FD
#
# All rights reserved - Do Not Redistribute
#

log "Installing and configuring Redis..."


include_recipe "redisio::install"
include_recipe "redisio::enable"

## Case cookbook 'redisio' doesn't work use the default package
# package "redis-server" do
#   action :install
#   options "--force-yes"
# end

log "Redis ready to use."
