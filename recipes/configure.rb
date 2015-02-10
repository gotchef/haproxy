#
#  haproxy::configure
#

include_recipe 'runit'

runit_service 'haproxy' do
	action :nothing 
end

user = node[:haproxy][:service][:user]
group = node[:haproxy][:service][:group]

template "#{node[:haproxy][:service][:conf_dir]}/haproxy.cfg" do
	cookbook node[:haproxy][:config][:template_cookbook]
	source 'haproxy.cfg.erb'
	owner user
	group group
	mode 0644
	variables(
	:nginx_hosts => []
	)
	notifies :restart, 'runit_service[haproxy]'
end


