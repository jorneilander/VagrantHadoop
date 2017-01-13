Vagrant.configure("2") do |config|
	config.vm.box = "centos/7"
	config.vm.synced_folder ".", "/vagrant", type: 'virtualbox'


	config.vm.define "ambari" do |ambari|
		ambari.vm.hostname = "ambari.example.com"
		ambari.vm.network "private_network", ip: "10.1.0.2", virtualbox__intnet: "mynetwork"

		ambari.vm.provider "virtualbox" do |vb|
			vb.memory = 2048
			vb.cpus = 4
		end

		ambari.vm.provision "shell", inline: "sudo sh /vagrant/disable_ipv6.sh"

		ambari.vm.provision "shell", inline: "sudo mkdir -p /root/.ssh"
		ambari.vm.provision "shell", inline: "sudo cp /vagrant/id_rsa /root/.ssh/id_rsa"
		ambari.vm.provision "shell", inline: "chmod 700 /root/.ssh/id_rsa"
		ambari.vm.provision "shell", inline: "sudo cat /vagrant/id_rsa.pub >> /root/.ssh/authorized_keys"

		ambari.vm.provision "shell", inline: "yum install -y epel-release"
		ambari.vm.provision "shell", inline: "yum install -y ansible"
		ambari.vm.provision "shell", inline: "cp /vagrant/hosts /etc/ansible/hosts"
		ambari.vm.provision "shell", inline: "sed -i 's/#host_key_checking/host_key_checking/' /etc/ansible/ansible.cfg"

		ambari.vm.provision "shell", inline: "cp /vagrant/roles/common/files/hosts /etc/hosts"

		#BUG: http://stackoverflow.com/questions/32518591/centos7-with-private-network-lost-fixed-ip
		ambari.vm.provision "shell", inline: "nmcli connection reload"
		ambari.vm.provision "shell", inline: "systemctl restart network.service"
	end

	config.vm.define "master" do |master|
		master.vm.hostname = "master.example.com"
		master.vm.network "private_network", ip: "10.1.0.3", virtualbox__intnet: "mynetwork"
		master.vm.provider "virtualbox" do |vb|
			vb.memory = 4608
			vb.cpus = 4
		end
		master.vm.provision "shell", inline: "sudo mkdir -p /root/.ssh"
		master.vm.provision "shell", inline: "sudo cat /vagrant/id_rsa.pub >> /root/.ssh/authorized_keys"

		master.vm.provision "shell", inline: "sudo sh /vagrant/disable_ipv6.sh"

		#BUG: http://stackoverflow.com/questions/32518591/centos7-with-private-network-lost-fixed-ip
		master.vm.provision "shell", inline: "nmcli connection reload"
		master.vm.provision "shell", inline: "systemctl restart network.service"
	end

	config.vm.define "support" do |support|
		support.vm.hostname = "support.example.com"
		support.vm.network "private_network", ip: "10.1.0.4", virtualbox__intnet: "mynetwork"
		support.vm.provider "virtualbox" do |vb|
			vb.memory = 3584
			vb.cpus = 4
		end
		support.vm.provision "shell", inline: "sudo mkdir -p /root/.ssh"
		support.vm.provision "shell", inline: "sudo cat /vagrant/id_rsa.pub >> /root/.ssh/authorized_keys"

		support.vm.provision "shell", inline: "sudo sh /vagrant/disable_ipv6.sh"

		#BUG: http://stackoverflow.com/questions/32518591/centos7-with-private-network-lost-fixed-ip
		support.vm.provision "shell", inline: "nmcli connection reload"
		support.vm.provision "shell", inline: "systemctl restart network.service"
	end

	config.vm.define "node1" do |node1|
		node1.vm.hostname = "node1.example.com"
		node1.vm.network "private_network", ip: "10.1.0.5", virtualbox__intnet: "mynetwork"
		node1.vm.provider "virtualbox" do |vb|
			vb.memory = 1536
			vb.cpus = 4
		end
		node1.vm.provision "shell", inline: "sudo mkdir -p /root/.ssh"
		node1.vm.provision "shell", inline: "sudo cat /vagrant/id_rsa.pub >> /root/.ssh/authorized_keys"

		node1.vm.provision "shell", inline: "sudo sh /vagrant/disable_ipv6.sh"

		#BUG: http://stackoverflow.com/questions/32518591/centos7-with-private-network-lost-fixed-ip
		node1.vm.provision "shell", inline: "nmcli connection reload"
		node1.vm.provision "shell", inline: "systemctl restart network.service"
	end

	config.vm.define "node2" do |node2|
		node2.vm.hostname = "node2.example.com"
		node2.vm.network "private_network", ip: "10.1.0.6", virtualbox__intnet: "mynetwork"
		node2.vm.provider "virtualbox" do |vb|
			vb.memory = 1536
			vb.cpus = 4
		end
		node2.vm.provision "shell", inline: "sudo mkdir -p /root/.ssh"
		node2.vm.provision "shell", inline: "sudo cat /vagrant/id_rsa.pub >> /root/.ssh/authorized_keys"

		node2.vm.provision "shell", inline: "sudo sh /vagrant/disable_ipv6.sh"

		#BUG: http://stackoverflow.com/questions/32518591/centos7-with-private-network-lost-fixed-ip
		node2.vm.provision "shell", inline: "nmcli connection reload"
		node2.vm.provision "shell", inline: "systemctl restart network.service"
	end

end
