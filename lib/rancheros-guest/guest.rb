require "vagrant"

module VagrantPlugins
  module GuestRancherOS
    class Guest < Vagrant.plugin("2", :guest)
      def detect?(machine)
        machine.communicate.test("cat /etc/issue | grep 'RancherOS'")
      end
    end
  end
end