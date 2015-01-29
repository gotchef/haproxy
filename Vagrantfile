# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
 	config.vm.box = "hashicorp/precise64"
	config.vm.provider "virtualbox" do |v|
		v.memory = 1024
		v.cpus = 2
	end
	config.vm.provider "vmware_fusion" do |v|
		v.vmx["memsize"] = "1024"
		v.vmx["numvcpus"] = "2"
	end
	config.omnibus.chef_version = :latest
	config.berkshelf.enabled = true
	
	config.vm.provision "chef_zero" do |chef|
		chef.add_recipe "haproxy::install"
		chef.add_recipe "haproxy::service"
	end
end
