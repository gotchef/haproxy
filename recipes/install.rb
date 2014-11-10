package "haproxy" do
  version node['haproxy']['package']['version'] if node['haproxy']['package']['version']
end

group = node[:haproxy][:group]
user = node[:haproxy][:user]

# setup group
group group do
end

# setup user
user user do
  comment "Daemon"
  gid group
  shell "/bin/noshell"
  supports :manage_home => false
end

directory "#{node[:haproxy][:conf_dir]}" do
	group group
	owner user
	mode "0775"
	action :create
	recursive true
end


