#
# Cookbook Name:: site-cookbooks/kn_deployer
# Recipe:: default
#
# Copyright (C) 2014, Cuck FD
#
# All rights reserved - Do Not Redistribute
#

log "Setting users default environment parameters..."

script "Delete temporary files" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOF
  rm -fr /tmp/sources
  EOF
end

# Setting users default settings via configuration files:
## bashrc: Bourne-Again shell configuration file.
## vimrc: ViM (text file editor) configuration file.
## irbrc: IRB (ruby default console) configuration file.
## gemrc: Rubygem configuration file, manage the way gem are installed on the system.
## gitconfig: Git (Source Code Management system) configuration file.
%w(bashrc vimrc irbrc gemrc gitconfig).each do |dotfile|
  template "/etc/skel/.#{dotfile}" do
    source "#{dotfile}.erb"
    owner "root"
    group "root"
    mode 00644
  end
end

# User environment default settings file.
environment_file_path = "/etc/environment"
template environment_file_path do
  source "environment.erb"
  owner "root"
  group "root"
  mode 00644
  not_if do
    ::File.exist?(environment_file_path) && ::File.read(environment_file_path).match(/GIT_EDITOR/)
  end
end

log "Users default settings configured."
