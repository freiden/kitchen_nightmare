#
# Cookbook Name:: site-cookbooks/kn_deployer
# Recipe:: default
#
# Copyright (C) 2014, Cuck FD
#
# All rights reserved - Do Not Redistribute
#

log "Setting Version Control System agent: 'Git'..."

include_recipe "git"

bash "Updating git by using git package" do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  cd
  rm -fr git/
  git clone https://github.com/git/git.git
  cd git
  git checkout v#{node[:server_ingredients][:git_version]}
  make prefix=/usr/local all
  sudo make prefix=/usr/local install
  EOH
end


log "VCS agent installed and configured."
