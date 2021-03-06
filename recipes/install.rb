# 
# kaproxy::install
#

package 'haproxy' do
  version node[:haproxy][:package][:version] if node[:haproxy][:package][:version]
end

user = node[:haproxy][:service][:user]
group = node[:haproxy][:service][:group]

group group do
	not_if { 'root' == group.to_s.downcase }
end

user user do
	comment 'created by chef'
	gid group
	supports :manage_home => false
	system true
	shell '/bin/noshell'
	not_if { 'root' == user.to_s.downcase }
end

directory node[:haproxy][:service][:conf_dir] do
	owner user
	group group
	mode '0775'
	recursive true
end


