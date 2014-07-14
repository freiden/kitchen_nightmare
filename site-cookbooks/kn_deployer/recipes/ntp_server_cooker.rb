#
# Cookbook Name:: site-cookbooks/kn_deployer
# Recipe:: default
#
# Copyright (C) 2014, Cuck FD
#
# All rights reserved - Do Not Redistribute
#

log "Setting NTP server 'ntpdate'..."

# This recipe install the following package:
## Ntpdate: To manage time setting by synchronizing on a ntp server
package 'ntpdate' do
  action :install
end

log "Creating Ntpdate cron job"
template "/etc/cron.daily/ntpdate" do
  source 'ntpdate.erb'
  owner   'root'
  group   'root'
  mode    '0655'
end

service "ntp" do
  action :stop
end


log "Synchronizing server by executing ntpdate cron job"
execute "ntpdate" do
  command "/etc/cron.daily/./ntpdate"
  action :run
  user 'root'
end

log "Ntpdate and related cron job configured"
