#
# Cookbook Name:: minecraft
# Recipe:: default
#
# Copyright 2013, Greg Fitzgerald
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node.override['java']['jdk_version'] = 7

include_recipe 'java::default'

if node['minecraft']['use_runit']
  include_recipe 'runit'
else
  # we need this for our init script:
  package 'screen'
end

jar_name = "#{node['minecraft']['jar']}.#{node['minecraft']['version']}.jar"
minecraft_jar = "#{Chef::Config['file_cache_path']}/#{jar_name}"

node.default['minecraft']['jar_name'] = jar_name

source_url = "#{node['minecraft']['base_url']}/#{node['minecraft']['version']}/#{jar_name}"
log "Using #{jar_name}, stored locally as #{minecraft_jar} and fetched from #{source_url}"

include_recipe 'minecraft::user'

remote_file minecraft_jar do
  source source_url
  checksum node['minecraft']['checksum']
  owner node['minecraft']['user']
  group node['minecraft']['group']
  mode 0644
  action :create_if_missing
end

directory node['minecraft']['install_dir'] do
  owner node['minecraft']['user']
  group node['minecraft']['group']
  mode 0755
  action :create
  recursive true
end

execute 'copy-minecraft_server.jar' do
  cwd node['minecraft']['install_dir']
  command "cp -p #{minecraft_jar} ."
  creates "#{node['minecraft']['install_dir']}/#{node['minecraft']['jar']}"
end

include_recipe 'minecraft::service'

%w[ops.txt server.properties banned-ips.txt
   banned-players.txt white-list.txt].each do |template|
  template "#{node['minecraft']['install_dir']}/#{template}" do
    source "#{template}.erb"
    owner node['minecraft']['user']
    group node['minecraft']['group']
    mode 0644
    action :create
    notifies :restart,  node['minecraft']['runit']?'runit_service[minecraft]':'service[minecraft]'
  end
end

if node['minecraft']['runit'] 
  runit_service 'minecraft'
else
  template '/etc/init.d/minecraft' do
    source 'minecraft.init.erb'
    mode 0755
  end
end


service 'minecraft' do
  action [ :enable, :start ]
  supports :status => true, :restart => true, :reload => true
  reload_command "#{node['runit']['sv_bin']} hup #{node['runit']['service_dir']}/minecraft" if node['minecraft']['runit']
end
  
