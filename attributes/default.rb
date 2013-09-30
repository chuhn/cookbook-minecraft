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
