# based on https://github.com/ailispaw/rancheros-iso-box/blob/master/vagrant_plugin_guest_rancheros.rb

module VagrantPlugins
  module GuestRancherOS
    module Cap
      class ChangeHostName
        def self.change_host_name(machine, name)
          machine.communicate.tap do |comm|
            ['console', 'userdocker', 'syslog', 'ntp'].each do |conatiner|
              comm.sudo("system-docker exec #{conatiner} sh -c 'hostname | grep '^#{name}$' || echo \"#{name}\" > /etc/hostname' || true")
              comm.sudo("system-docker exec #{conatiner} hostname -F /etc/hostname || true")
            end
          end
        end
      end
    end
  end
end