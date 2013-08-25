#
# Cookbook Name:: minecraft
# Recipe:: default
#
# Copyright 2012, Greg Fitzgerald
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

include_recipe 'runit'
include_recipe 'java::default'
include_recipe 'logrotate'
include_recipe 'iptables'

mc_jar = "minecraft_server.#{node['minecraft']['version']}.jar"
source_url = "#{node['minecraft']['base_url']}/#{node['minecraft']['version']}/#{mc_jar}"

uid = node['minecraft']['user']
gid = node['minecraft']['group']

user uid do
  system true
  comment 'Minecraft Server'
  home node['minecraft']['dir']
  shell '/bin/false'
  action :create
end

remote_file "#{Chef::Config['file_cache_path']}/#{mc_jar}" do
  source "#{source_url}"
  checksum node['minecraft']['checksum']
  owner uid
  group gid
  mode '0644'
  action :create_if_missing
end

directory node['minecraft']['dir'] do
  owner uid
  group gid
  mode '0755'
  action :create
  recursive true
end

execute 'copy minecraft server jar file' do
  cwd node['minecraft']['dir']
  command "cp -p #{Chef::Config['file_cache_path']}/#{mc_jar} ."
  creates "#{node['minecraft']['dir']}/#{mc_jar}"
  not_if { ::File.exists?("#{node['minecraft']['dir']}/#{mc_jar}") }
end

%w[ops.txt server.properties banned-ips.txt
   banned-players.txt white-list.txt].each do |template|
  template "#{node['minecraft']['dir']}/#{template}" do
    source "#{template}.erb"
    owner uid
    group gid
    mode 0644
    action :create
    notifies :restart, 'runit_service[minecraft]' if node['minecraft']['auto_restart']
  end
end

runit_service "minecraft"

service 'minecraft' do
  supports :status => true, :restart => true, :reload => true
  reload_command "#{node['runit']['sv_bin']} hup #{node['runit']['service_dir']}/minecraft"
end
