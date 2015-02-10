#
# haproxy::default
#

# generally this recipe should not be used and instead wrapper cookbooks should
# run install, then their own configure, then service

include_recipe "haproxy::install"
include_recipe "haproxy::configure"
include_recipe "haproxy::service"
