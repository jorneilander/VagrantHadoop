You can use these files to create a fully functional Hadoop cluster through automation (Ansible)

Steps:

- Install Vagrant (http://www.vagrantup.com)
- Install VirtualBox (http://www.virtualbox.org)

Extract the project files into your desired directory  
Run these commands in order:

```
vagrant plugin install vagrant-vbguest
vagrant up
vagrant ssh ambari -c 'sudo ansible-playbook /vagrant/playbook.yml'
```

To connect to Ambari using your browser:

- Open Putty
- Hostname: 127.0.0.1
- Port: 2222
- Connection -> SSH -> Auth -> <private key for authentication>: Browse for the id_rsa.ppk file
- Connection -> SSH -> Tunnels:
	+ Source Port: 8888
	+ Destination: 10.1.0.2:8080
	+ Click [Add]
	
Now when you brose to http://127.0.0.1:8888 after Ansible is done, Ambari should pop-up  
Username and password are "admin"  

Don't forget to scale your machines for your hardware in Vagrantfile