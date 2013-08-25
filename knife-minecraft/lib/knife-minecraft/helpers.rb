class Chef
  class Knife
    class Minecraft
      module Helpers
        def knife_ssh(addr, command, args={})
          cmd = "ssh -t #{config[:minecraft_ssh_user]}@#{addr} #{command}"
          system(cmd)
        end
      end
    end
  end
end
