#
# Cookbook Name:: site-cookbooks/kn_deployer
# Recipe:: default
#
# Copyright (C) 2014, Cuck FD
#
# All rights reserved - Do Not Redistribute
#

log "Installing and/or updating usefull packages."
# BOFH = Bastard Operator From Hell... Thx TDD :)
# This recipe install the following packages:
## ViM-Nox: Vim with default support of Ruby
## Bash-completion: Programmable completion for the bash shell
## Tmux: Terminal multiplexer
## Multitail: View multiple logfiles windowed on console
## Htop: View multiple logfiles windowed on console
## Multitee: send multiple inputs to multiple outputs
## Nmap The Network Mapper
## Curl: Get a file from an HTTP, HTTPS or FTP server
## Tree: Displays directory tree, in color
## Telnet: Telnet client
## Unzip: De-archiver for .zip files
## Wget: Retrieves files from the web
## Ack-grep: Grep-like program specifically for large source trees
## Default-jre: JRE
## Packages for Imagemagick : libxml2 libxml2-dev libjpeg libjpeg-dev libpng libpng-dev
## libjasper1 libjasper-dev libltdl7-dev

%w(build-essential vim-nox bash-completion tmux
  multitail htop multitee nmap curl tree
  telnet unzip wget ack-grep default-jre
  libxml2 libxml2-dev libjpeg-turbo8 libjpeg-turbo8-dev
  libpng12-0 libpng12-dev libjasper1 libjasper-dev
  libltdl7-dev libssl-dev libcurl4-openssl-dev libexpat1-dev
  libfreeimage-dev gettext ruby-dev ghostscript).each do |pack|
  package pack do
    action :install
    options "--force-yes"
  end
end


# Install ImageMagick
immgck_url = "http://www.imagemagick.org/download/ImageMagick.tar.gz"
immgck_src_filename = ::File.basename(immgck_url)
immgck_src_filepath = "#{Chef::Config['file_cache_path']}/#{immgck_src_filename}"
immgck_extract_path = "#{Chef::Config['file_cache_path']}/imagemagick"
remote_file immgck_src_filepath do
  source immgck_url
  owner "root"
  group "root"
  mode 00644
end

bash "Install ImageMagick" do
  user "root"
  cwd ::File.dirname(immgck_src_filepath)
  code <<-EOH
    mkdir -p #{immgck_extract_path}
    tar xzf #{immgck_src_filename} -C #{immgck_extract_path}
    mv #{immgck_extract_path}/*/* #{immgck_extract_path}
    cd #{immgck_extract_path}
    ./configure --disable-static --with-modules --without-perl \
    --without-magick-plus-plus --with-quantum-depth=8 \
    --with-gvc=no --with-jp2=yes --with-lcms=no --with-lqr=no --with-openexr=no --with-rsvg=no --with-wmf=no --with-xml=yes \
    --with-gs-font-dir=/usr/share/fonts/type1/gsfonts
    make
    make install
  EOH
  not_if { ::File.exists?(immgck_extract_path) }
end

ohai "reload" do
  action :reload
end

log "Usefull packages installed."
