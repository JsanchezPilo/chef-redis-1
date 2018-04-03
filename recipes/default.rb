#
# Cookbook Name:: redis-simple
# Recipe:: default
#
# Copyright 2018 Andrei Skopenko
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'yum-epel' unless node['platform_family'] == 'debian'

package node['redis']['pkg_name']

template File.join(node['redis']['conf_dir'], 'redis.conf') do
  variables options: node['redis']['config']
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, "service[#{node['redis']['service_name']}]"
end

template File.join(node['redis']['sysconfig_dir'], node['redis']['pkg_name']) do
  source 'redis.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, "service[#{node['redis']['service_name']}]"
end

service node['redis']['service_name'] do
  supports status: true, reload: true, restart: true
  action [:enable, :start]
end
