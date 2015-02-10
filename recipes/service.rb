#
# haproxy::service
#

include_recipe 'runit'

runit_service 'haproxy' do
	default_logger true
	options({
	:config => "#{node[:haproxy][:service][:conf_dir]}/haproxy.cfg",
	:exec => '/usr/sbin/haproxy',
	:user => node[:haproxy][:service][:user]
	})
	action [:enable, :start]
end
