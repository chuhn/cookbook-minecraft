#
# Cookbook Name:: minecraft
# Attributes:: default
#
# Copyright 2013, Greg Fitzgerald.
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['minecraft']['user']                = 'mcserver'
default['minecraft']['group']               = 'mcserver'
default['minecraft']['install_dir']         = '/srv/minecraft'
default['minecraft']['base_url']            = 'https://s3.amazonaws.com/Minecraft.Download/versions/1.6.2'
default['minecraft']['jar']                 = 'minecraft_server.1.6.2.jar'
default['minecraft']['checksum']            = '7a1abdac5d412b7eebefd84030d40c1591c17325801dba9cbbeb3fdf3c374553'

default['minecraft']['xms']                 = '128M'
default['minecraft']['xmx']                 = '512M'
# Additional options to be passed to java, for runit only
default['minecraft']['java-options']        = ''
default['minecraft']['init_style']          = 'mark2'

default['minecraft']['banned-ips']          = []
default['minecraft']['banned-players']      = []
default['minecraft']['white-list-users']    = []
default['minecraft']['ops']                 = []

# See the readme for an explanation
default['minecraft']['autorestart'] = true
