vagrant plugin install vagrant-vbguest
vagrant up
vagrant ssh ambari -c 'sudo ansible-playbook /vagrant/playbook.yml'