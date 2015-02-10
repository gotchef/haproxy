#
# haproxy::failover
#
# this recipe is meant to be run manually one node at a time
#
# Configures High Avaliability Failover where two nodes function as a active - passive failover
# https://aws.amazon.com/articles/2127188135977316

include_recipe 'runit'

config_dir=[:haproxy][:service][:conf_dir]

template "#{config_dir}/failover_monitor.sh" do
	cookbook "haproxy"
	source "failover_monitor.sh.erb"
	owner "root"
	group "root"
	mode 0744
	variables(
	:other_node_primary_ip => node[:failover][:manual][:other_node_primary_ip],
	:shared_private_ip => node[:failover][:manual][:shared_private_ip],
	:aws_region => node[:cloud][:aws][:region]
	)
end

runit_service 'haproxyfailover' do
	default_logger true
	options({
		:exec => "#{config_dir}/failover_monitor.sh"
	})
	action [:enable, :start]
end

