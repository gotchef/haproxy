# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
 	config.vm.box = "hashicorp/precise64"
	config.omnibus.chef_version = :latest
	config.berkshelf.enabled = true
	
	config.vm.provision "chef_zero" do |chef|
		chef.add_recipe "haproxy::install"
		chef.add_recipe "haproxy::service"
	end
end
