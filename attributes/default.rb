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

# Default server properties
default['minecraft']['properties']['allow-nether']        = true
default['minecraft']['properties']['generator-settings']  = ''
default['minecraft']['properties']['level-name']          = 'world'
default['minecraft']['properties']['enable-query']        = false
default['minecraft']['properties']['allow-flight']        = false
default['minecraft']['properties']['server-port']         = '25565'
default['minecraft']['properties']['level-type']          = 'DEFAULT'
default['minecraft']['properties']['enable-rcon']         = false
default['minecraft']['properties']['level-seed']          = ''
default['minecraft']['properties']['server-ip']           = ''
default['minecraft']['properties']['max-build-height']    = 256
default['minecraft']['properties']['spawn-npcs']          = true
default['minecraft']['properties']['white-list']          = false
default['minecraft']['properties']['spawn-animals']       = true
default['minecraft']['properties']['snooper-enabled']     = true
default['minecraft']['properties']['online-mode']         = true
default['minecraft']['properties']['pvp']                 = true
default['minecraft']['properties']['hardcore']            = false
default['minecraft']['properties']['texture-pack']        = ''
default['minecraft']['properties']['difficulty']          = 1
default['minecraft']['properties']['force-gamemode']      = false
default['minecraft']['properties']['gamemode']            = 0
default['minecraft']['properties']['max-players']         = 20
default['minecraft']['properties']['player-idle-timeout'] = 0
default['minecraft']['properties']['spawn-monsters']      = true
default['minecraft']['properties']['generate-structures'] = true
default['minecraft']['properties']['view-distance']       = 10
default['minecraft']['properties']['motd']                = 'A Minecraft Server'
