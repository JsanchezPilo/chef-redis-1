#
# Cookbook Name:: redis
# Attributes:: default
#
# Copyright 2015 Andrei Skopenko
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

# platform specific options
case node['platform_family']
when 'debian'
  default['redis']['sysconfig_dir'] = '/etc/default'
  default['redis']['pkg_name'] = 'redis-server'
  default['redis']['conf_dir'] = '/etc/redis'
  default['redis']['service_name'] = 'redis'
when 'rhel', 'fedora'
  default['redis']['sysconfig_dir'] = '/etc/sysconfig'
  default['redis']['pkg_name'] = 'redis'
  default['redis']['conf_dir'] = '/etc'
  default['redis']['service_name'] = 'redis'
end

default['redis']['config'] = {
  'bind' => '127.0.0.1',
  'protected-mode' => 'yes',
  'port' => 6379,
  'tcp-backlog' => 511,
  'timeout' => 0,
  'tcp-keepalive' => 300,
  'daemonize' => 'yes',
  'supervised' => 'no',
  'pidfile' => '/var/run/redis/redis-server.pid',
  'logfile' => '/var/log/redis/redis-server.log',
  'loglevel' => 'notice',
  'databases' => 16,
  'save' => '900 1',
  'stop-writes-on-bgsave-error' => 'yes',
  'rdbcompression' => 'yes',
  'rdbchecksum' => 'yes',
  'dbfilename' => 'dump.rdb',
  'dir' => '/var/lib/redis',
  'slave-serve-stale-data' => 'yes',
  'slave-read-only' => 'yes',
  'repl-diskless-sync' => 'no',
  'repl-diskless-sync-delay' => 5,
  'repl-disable-tcp-nodelay' => 'no',
  'slave-priority' => 100,
  'appendonly' => 'no',
  'appendfilename' => 'appendonly.aof',
  'appendfsync' => 'everysec',
  'no-appendfsync-on-rewrite' => 'no',
  'auto-aof-rewrite-percentage' => 100,
  'auto-aof-rewrite-min-size' => '64mb',
  'aof-load-truncated' => 'yes',
  'lua-time-limit' => 5000,
  'slowlog-log-slower-than' => 10000,
  'slowlog-max-len' => 128,
  'latency-monitor-threshold' => 0,
  'hash-max-ziplist-entries' => 512,
  'hash-max-ziplist-value' => 64,
  'list-max-ziplist-size' => '-2',
  'list-compress-depth' => 0,
  'set-max-intset-entries' => 512,
  'zset-max-ziplist-entries' => 128,
  'zset-max-ziplist-value' => 64,
  'hll-sparse-max-bytes' => 3000,
  'activerehashing' => 'yes',
  'client-output-buffer-limit' => 'normal 0 0 0',
  'hz' => 10,
  'aof-rewrite-incremental-fsync' => 'yes',
}
