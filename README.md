#Minecraft [![Build Status](https://secure.travis-ci.org/gregf/cookbook-minecraft.png)](http://travis-ci.org/gregf/cookbook-minecraft)

##Description

Installs the vanilla [Minecraft](http://www.minecraft.net) server.

* Source Code: http://github.com/gregf/cookbook-minecraft

##Requirements

###Chef

Tested on chef 11

###Cookbooks

* [java](http://community.opscode.com/cookbooks/java)
* [runit](http://community.opscode.com/cookbooks/runit)
* [build-essential](http://community.opscode.com/cookbooks/build-essential)
* [logrotate](http://community.opscode.com/cookbooks/logrotate)

###Platforms

Supported platforms:

* Debian 6
* Ubuntu 12.04+
* Centos 6.4

##Attributes

See `attributes/default.rb` for default values.

#### Server setup options

* `default['minecraft']['user']`
* `default['minecraft']['install_dir']`
* `default['minecraft']['base_url']`
* `default['minecraft']['jar']`

#### Server properties

Here are some example properties that are set in the attributes now, however you
can set any of the properties defined here as well:
http://www.minecraftwiki.net/wiki/Server.properties#Minecraft_server_properties

* `default['minecraft']['properties']['banned-ips']`
* `default['minecraft']['properties']['banned-players']`
* `default['minecraft']['properties']['white-list-users']`
* `default['minecraft']['properties']['ops']`

* `default['minecraft']['properties']['allow-nether']`
* `default['minecraft']['properties']['level-name']`
* `default['minecraft']['properties']['enable-query']`
* `default['minecraft']['properties']['allow-flight']`
* `default['minecraft']['properties']['server-port']`
* `default['minecraft']['properties']['level-type']`
* `default['minecraft']['properties']['enable_rcon']`
* `default['minecraft']['properties']['level-seed']`
* `default['minecraft']['properties']['server-ip']`
* `default['minecraft']['properties']['max-build-height']`
* `default['minecraft']['properties']['spawn-npcs']`
* `default['minecraft']['properties']['white-list']`
* `default['minecraft']['properties']['spawn-animals'] `
* `default['minecraft']['properties']['online-mode']`
* `default['minecraft']['properties']['pvp']`
* `default['minecraft']['properties']['difficulty']`
* `default['minecraft']['properties']['gamemode']`
* `default['minecraft']['properties']['max-players']`
* `default['minecraft']['properties']['spawn-monsters']`
* `default['minecraft']['properties']['generate-structures']`
* `default['minecraft']['properties']['view-distance']`
* `default['minecraft']['properties']['motd']`

##Usage

Include the `minecraft` recipe and modify your run list and set any attributes
you would like changed.

    run_list [
      "recipe[minecraft]"
    ]
    "minecraft":{
      "motd": "Welcome all griefers!"
      "max-players": 9001
      "ops": ["nappa", "goku"]
    }


##Recipes

###default

Include the default recipe into your run_list to install a `minecraft` server.
Configuration files are prepopulated based on values in attributes. I will keep
the defaults in sync with upstream.

##Contributing

e.g.

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

##License and Authors

Authors: Greg Fitzgerald <greg@gregf.org>

```
# Copyright 2013, Greg Fitzgerald.
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
```
