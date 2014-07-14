#
# Cookbook Name:: site-cookbooks/kn_deployer
# Recipe:: default
#
# Copyright (C) 2014, Cuck FD
#
# All rights reserved - Do Not Redistribute
#

log "Setting mail server: 'postifx'..."

include_recipe "postfix"

node.default['postfix']['mail_relay_networks'] = "127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128"
node.default['postfix']['myorigin'] = node[:server_ingredients][:hostname]
# node.default['postfix']['mydestination'] = 'ns25928.ovh.net, localhost.ovh.net, localhost'
node.default['postfix']['relayhost'] = ''
node.default['postfix']['main']['smtp_use_tls'] = 'no'
node.default['postfix']['main']['smtpd_use_tls'] = 'no'
node.default['postfix']['inet_interfaces'] = 'loopback-only'

service "postfix" do
  action :restart
end


# TODO: Replace email_supervision_suffix by email_supervision
bash "Configuring Postfix" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  echo "root: #{node[:server_ingredients][:email_supervision]}" >> /etc/aliases
  EOH
end

log "Postfix configured."
