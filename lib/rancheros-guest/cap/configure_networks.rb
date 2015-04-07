# based on https://github.com/ailispaw/rancheros-iso-box/blob/master/vagrant_plugin_guest_rancheros.rb

require 'ipaddr'

# Borrowing from http://stackoverflow.com/questions/1825928/netmask-to-cidr-in-ruby
IPAddr.class_eval do
  def to_cidr
    self.to_i.to_s(2).count("1")
  end
end

module VagrantPlugins
  module GuestRancherOS
    module Cap
      class ConfigureNetworks
        def self.configure_networks(machine, networks)
          machine.communicate.tap do |comm|
            networks.each do |network|
              iface = "eth#{network[:interface]}"
              dhcp  = "true"

              if network[:type] == :static
                cidr = IPAddr.new(network[:netmask]).to_cidr
                comm.sudo("rancherctl config set network.interfaces.#{iface}.address #{network[:ip]}/#{cidr}")
                dhcp = "false"
              end

              comm.sudo("rancherctl config set network.interfaces.#{iface}.dhcp #{dhcp}")
            end

            comm.sudo("system-docker restart network")
          end
        end
      end
    end
  end
end