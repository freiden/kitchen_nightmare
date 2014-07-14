#
# Cookbook Name:: site-cookbooks/kn_deployer
# Recipe:: default
#
# Copyright (C) 2014, Cuck FD
#
# All rights reserved - Do Not Redistribute
#

log "Putting up-to-date server operating system..."


log "Updating environment variables..."
# Set language environment variables values
ENV['LANG'] = 'fr_FR.utf8'
ENV['LC_ALL'] = 'fr_FR.utf8'
ENV['DEBIAN_FRONTEND'] = 'noninteractive'

log "Environment variables updated!"


# Install "aptitude" if not present by default
log "Installing aptitude..."

package "aptitude" do
  action :install
end

log "Installed aptitude!"

# Update ubuntu packages
execute "keep server up to date commands" do
  user 'root'
  command "aptitude update && aptitude -y safe-upgrade"
  action :run
end

log "Server operating system up-to-date."
