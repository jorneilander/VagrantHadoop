# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
	config.vm.box = "centos/7"
  
	config.vm.define "router" do |router|
		router.vm.box = "geerlingguy/centos7"
		router.vm.hostname = "router.example.com"
		router.vm.network "public_network"
		router.vm.network "private_network", ip: "10.1.0.2", virtualbox__intnet: "mynetwork"
		
		router.vm.provider "virtualbox" do |vb|
			vb.memory = 1024
			vb.cpus = 1
		end
		
		router.vm.provision "shell", inline: "sudo ssh-keygen -f /root/.ssh/id_rsa -N \"\""
		router.vm.provision "shell", inline: "sudo ssh-keygen -y -f /root/.ssh/id_rsa > /vagrant/id_rsa.pub"
		router.vm.provision "shell", inline: "yum install -y epel-release"
		router.vm.provision "shell", inline: "yum install -y ansible"
		router.vm.provision "shell", inline: "cp /vagrant/artifacts/hosts /etc/ansible/hosts"
		router.vm.provision "shell", inline: "ansible-playbook /vagrant/artifacts/playbook_router.yml"
	end	
	
	config.vm.define "ambari" do |ambari|
		ambari.vm.box = "geerlingguy/centos7"
		ambari.vm.hostname = "ambari.example.com"
		ambari.vm.network "private_network",type: "dhcp", virtualbox__intnet: "mynetwork"
		ambari.vm.provider "virtualbox" do |vb|
			vb.memory = 1024
			vb.cpus = 2
		end
		ambari.vm.provision "shell", inline: "sudo mkdir -p /root/.ssh"
		ambari.vm.provision "shell", inline: "sudo cat /vagrant/id_rsa.pub >> /root/.ssh/authorized_keys"
		ambari.vm.provision "shell", inline: "cp /vagrant/artifacts/registerDNS.sh /etc/registerDNS.sh"
		ambari.vm.provision "shell", inline: "yum install -y bind-utils"
		ambari.vm.provision "shell", inline: "/etc/registerDNS.sh"
	end	
	
	config.vm.define "master1" do |master1|
		master1.vm.box = "geerlingguy/centos7"
		master1.vm.hostname = "master1.example.com"
		master1.vm.network "private_network", ip: "10.1.0.4", virtualbox__intnet: "mynetwork"
		master1.vm.provider "virtualbox" do |vb|
			vb.memory = 1024
			vb.cpus = 2
		end
		master1.vm.provision "shell", inline: "sudo mkdir -p /root/.ssh"
		master1.vm.provision "shell", inline: "sudo cat /vagrant/id_rsa.pub >> /root/.ssh/authorized_keys"
	end
	
	config.vm.define "master2" do |master2|
		master2.vm.box = "geerlingguy/centos7"
		master2.vm.hostname = "master2.example.com"
		master2.vm.network "private_network", ip: "10.1.0.5", virtualbox__intnet: "mynetwork"
		master2.vm.provider "virtualbox" do |vb|
			vb.memory = 1024
			vb.cpus = 2
		end
		master2.vm.provision "shell", inline: "sudo mkdir -p /root/.ssh"
		master2.vm.provision "shell", inline: "sudo cat /vagrant/id_rsa.pub >> /root/.ssh/authorized_keys"
	end	
end
