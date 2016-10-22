Install Vagrant (http://www.vagrantup.com)
Install VirtualBox (http://www.virtualbox.org)

Extract the project files into your desired directory
Run these commands in order:

vagrant plugin install vagrant-vbguest
vagrant up
vagrant ssh ambari -c 'sudo ansible-playbook /vagrant/playbook.yml'