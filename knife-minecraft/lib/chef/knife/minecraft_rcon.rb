# Author:: Greg Fitzgerald <greg@gregf.org>
# Copyright:: Copyright (c) 2013 Greg Fitzgerald
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'chef/knife/minecraft/core'
require 'knife-minecraft/helpers'

class Chef
  class Knife
    class MinecraftRcon < Knife

      include Knife::Minecraft::Core
      include Knife::Minecraft::Helpers

      banner 'knife minecraft rcon NODE_NAME'

      option :minecraft_node,
        :short => '-l FQDN|IP',
        :long => '--minecraft-node FQDN|IP',
        :description => 'Minecraft enabled node',
        :required => true

      option :minecraft_ssh_user,
        :short => '-X USERNAME',
        :long => '--minecraft-ssh-user USERNAME',
        :description => "SSH user for the minecraft server"

      option :rcon_password,
        :short => "-p RCON_PASSWORD",
        :long => "--rcon-password RCON_PASSWORD",
        :description => "Password for rcon"

      def run
        knife_ssh(config[:minecraft_node], "mcrcon -H localhost -p #{config[:rcon_password]} -t")
      end
    end
  end
end
