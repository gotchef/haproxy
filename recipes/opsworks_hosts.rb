#
# Gets the private IPs for all nodes in each layer
#

layers = node[:haproxy][:layers]

layers.each { |layer|

	instances = node[:opsworks][:layers][layer][:instances]

	hosts = []
	instances.each do |name, instance| 
		hosts.push("#{instance[:private_ip]}")
	end

	node.normal[:haproxy][:nodes][layer] = hosts
}
