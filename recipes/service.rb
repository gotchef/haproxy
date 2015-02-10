#
# haproxy::service
#

include_recipe 'runit'

runit_service 'haproxy' do
	default_logger true
	options({
	:config => "#{node[:haproxy][:service][:conf_dir]}/haproxy.cfg",
	:exec => '/usr/sbin/haproxy'
	})
	action [:enable, :start]
end
