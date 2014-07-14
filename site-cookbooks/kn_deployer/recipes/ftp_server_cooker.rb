#
# Cookbook Name:: site-cookbooks/kn_deployer
# Recipe:: default
#
# Copyright (C) 2014, Cuck FD
#
# All rights reserved - Do Not Redistribute
#

log "Setting FTP server: 'proftpd'..."

# This recipe install the following package:
## Ntpdate: To manage time setting by synchronizing on a ntp server
bash "Installing proftpd" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  echo proftpd-basic shared/proftpd/inetd_or_standalone 'select' 'standalone' | debconf-set-selections
  apt-get install -qy proftpd
  EOH
end

ruby_block "edit /etc/proftpd/proftpd.conf" do
  block do
    conf_file =  Chef::Util::FileEdit.new("/etc/proftpd/proftpd.conf")
    conf_file.search_file_replace_line(/^DeferWelcome/, "ServerIdent on 'Your Friendly Server'\nDeferWelcome on")
    conf_file.search_file_replace_line(/^DefaultRoot/, "DefaultRoot ~")
    conf_file.write_file
    File.open("/etc/shells", 'a') { |f| f.puts "/bin/false\n/bin/true" }
  end
end

log "Proftpd installed."
