#
#  Configures High Avaliability Failover where two nodes function as a active - passive failover
# https://aws.amazon.com/articles/2127188135977316
# this recipe is meant to be run manually one node at a time

include_recipe 'runit'

other_node_primary_ip=node[:failover][:manual][:other_node_primary_ip]
shared_private_ip=node[:failover][:manual][:shared_private_ip]
aws_region=node[:cloud][:aws][:region]

root_dir="/etc/haproxy"

template "#{root_dir}/failover_monitor.sh" do
  cookbook "haproxy-custom"
  source "failover_monitor.sh.erb"
  owner "root"
  group "root"
  mode 0755
  variables(
	:other_node_primary_ip => other_node_primary_ip,
	:shared_private_ip => shared_private_ip,
	:aws_region => aws_region
  )
end

runit_service 'haproxyfailover' do
	default_logger true
	options({
		:exec => "#{root_dir}/failover_monitor.sh"
	})
    action   [:enable, :start]
end

