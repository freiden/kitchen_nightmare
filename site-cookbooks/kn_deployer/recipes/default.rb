#
# Cookbook Name:: site-cookbooks/kn_deployer
# Recipe:: default
#
# Copyright (C) 2014, Cuck FD
#
# All rights reserved - Do Not Redistribute
#

#==========================================
# Server default environment setting recipes
#==========================================

# Changing server hostname recipe:
## Recipe used to replace server hostname by a defined one
include_recipe "hostname_cooker"

# Adding/Updading server packages recipe:
## Recipe used to install and update server packages
include_recipe "system_environment_cooker"

# Installing necessary packages recipe:
## Recipe used to install packages
include_recipe "packages_cooker"

# Installing configuration files recipe:
## Recipe used to set configuration

include_recipe "configuration_files_cooker"


#==========================================
# Server default environment setting recipes
#==========================================

# Installing and configuring ntp server recipe:
include_recipe "ntp_server_cooker"

# Installing and configuring mail server recipe:
include_recipe "mail_server_cooker"

# Installing and configuring ftp server recipe:
include_recipe "ftp_server_cooker"

# Installing and configuring vcs agent recipe:
include_recipe "vcs_agent_cooker"

# Installing and configuring firewall recipe:
include_recipe "firewall_cooker"


#==========================================
# Memory-based object stores
#==========================================

# Installing and configuring Memcached recipe
include_recipe "memcached_cooker"

# Installing and configuring Redis recipe
include_recipe "redis_cooker"

#==========================================
# Database server: Mysql
#==========================================
# TODO: Replace MySQL by Percona MySQL # http://phlippers.net/chef-percona/

# Installing and configuring database server
include_recipe "database_server_cooker"

#==========================================
# Web Server: Apache2
#==========================================
# Installing and configuring Apache2 web server
include_recipe "apache2_cooker"

#==========================================
# Specifics Settings
#==========================================
include_recipe "accounts_cooker"
include_recipe "ruby_environment_cooker"
include_recipe "nginx_cooker" # Require a ruby environment to build passenger module.


#==========================================
# Optionnal
#==========================================
include_recipe "failover_ip_cooker"
include_recipe "elasticsearch_cooker"
# include_recipe "monit_cooker" # WIP
