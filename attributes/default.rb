#
# attributes haproxy::default
#

name = 'haproxy'

default[:haproxy][:service][:name] = name
default[:haproxy][:service][:user] = name
default[:haproxy][:service][:group] = name
default[:haproxy][:service][:conf_dir] = '/etc/haproxy'

default[:haproxy][:package][:version] = nil
default[:haproxy][:config][:template_cookbook] = 'haproxy'
