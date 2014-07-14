#
# Cookbook Name:: site-cookbooks/kn_deployer
# Recipe:: default
#
# Copyright (C) 2014, Cuck FD
#
# All rights reserved - Do Not Redistribute
#

require 'ipaddr'

log "Check settings for failover IP"

def failover_ip_is_valid?(failover_ip)
  ip = IPAddr.new(failover_ip) rescue nil
  return ip.nil? ? nil : (ip.ipv4? || ip.ipv6?)
end

failover_ip = node[:server_ingredients][:failover_ip]
network_interfaces_file_path = '/etc/network/interfaces'
failover_ip_validity = failover_ip_is_valid?(failover_ip)

if failover_ip_validity && File.exists?(network_interfaces_file_path)
  ruby_block "Set failover IP" do
    block do
      interfaces_file = File.read(network_interfaces_file_path)
      if interfaces_file.match(/#{failover_ip}/)
        puts "The failover has already been set in the network interfaces file, so no change will be made and networking services won't be restarted."
      else
        original_ip = interfaces_file.match(/^.+address ([0-9.]+).*$/) and $1
        puts ""
        puts "Original IP: #{original_ip}"
        puts "New IP: #{failover_ip}"
        puts ""
        existing_virtual_index = interfaces_file.match(/^\niface eth0:([0-9]+).*\n$/) and $1
        iface = existing_virtual_index ? 'eth0:0' : "eth0:#{existing_virtual_index.to_i + 1}"
        puts "Configuring new interface (#{iface})..."
        interfaces_file << <<-EOS
# Added by Chef Script on #{DateTime.now}
auto #{iface}
iface #{iface} inet static
  address #{failover_ip}
  netmask 255.255.255.255
  broadcast #{failover_ip}
        EOS
        File.open("/etc/network/interfaces", 'w') { |f| f.puts interfaces_file }
        puts "Mise à jour effectué"
        puts "I will restart networking services.  This will take a few seconds..."

        cmd = Mixlib::ShellOut.new(%Q(/etc/init.d/networking restart)).run_command
        if cmd.exitstatus == 0
          puts "I just restarted the services!"
        else
          puts "Uh-oh, apparently could not restart networking."
        end
      end
    end
  end
else
  if !File.exists?(network_interfaces_file_path)
    Chef::Log.error "The network interfaces file has not been found!! Check your configuration"
    raise
  end
  if failover_ip_validity.nil? && (failover_ip == '' || failover_ip.nil? || failover_ip.strip.upcase == 'FIXME')
    log "No failover IP was defined"
  else
    Chef::Application.fatal!("The defined failover IP (#{failover_ip}) is not a valid IPv4 or IPv6 address", 0)
  end
end
