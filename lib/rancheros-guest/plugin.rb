require "vagrant"


module VagrantPlugins
  module GuestRancherOS
    class Plugin < Vagrant.plugin("2")
      name "RancherOS guest"
      description "RancherOS guest support."

      guest("rancheros", "linux") do
        require_relative "guest"
        Guest
      end

      guest_capability("rancheros", "change_host_name") do
        require_relative "cap/change_host_name"
        Cap::ChangeHostName
      end

      guest_capability("rancheros", "configure_networks") do
        require_relative "cap/configure_networks"
        Cap::ConfigureNetworks
      end

      # guest_capability("rancheros", "docker_daemon_running") do
      #   require_relative "cap/docker"
      #   Cap::Docker
      # end
    end
  end
end