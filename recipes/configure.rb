#
# Configure HAProxy
#

include_recipe 'runit'

include_recipe 'haproxy::opsworks_hosts'

runit_service "haproxy" do
  supports :restart => true, :status => true
  action :nothing # only define so that it can be restarted if the config changed
end

template "#{node['haproxy']['conf_dir']}/haproxy.cfg" do
  cookbook default[:haproxy][:config][:template_cookbook]
  source "haproxy.cfg.erb"
  owner "root"
  group "root"
  mode 0644
  variables(
     :nginx_hosts => node[:haproxy_custom][:nginx_hosts]
  )
  notifies :restart, "runit_service[haproxy]"
end


