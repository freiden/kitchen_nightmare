#
# Cookbook Name:: site-cookbooks/kn_deployer
# Recipe:: default
#
# Copyright (C) 2014, Cuck FD
#
# All rights reserved - Do Not Redistribute
#

log "Installation and configuration of firewall: 'fail2ban'..."

# Install fail2ban
package "fail2ban" do
  action :install
end

# Configuration
template "/etc/fail2ban/jail.local" do
  source "jail.local.erb"
  owner "root"
  group "root"
  mode 00644
end

template "/etc/fail2ban/action.d/sendmail-whois-lines.local" do
  source "sendmail-whois-lines.local.erb"
  owner "root"
  group "root"
  mode 00644
end

service "fail2ban" do
  action :restart
end

log "Fail2ban installed and configured"
