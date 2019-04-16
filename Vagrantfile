Vagrant.configure("2") do |config|
  config.ssh.forward_agent = true
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "private_network", type: "dhcp"
  config.vm.provision :salt do |salt|
    salt.bootstrap_options = "-P"
	  salt.verbose = true
  end
  config.vm.provision "shell", inline: "sudo cp /etc/salt/minion{,-dist} && sudo cp /vagrant/salt/minion /etc/salt/minion && sudo salt-call --local state.highstate"
  config.vm.network :forwarded_port, :guest => 8080, :host => 8080, auto_correct: true
  config.vm.provider "virtualbox" do |v|
    v.customize ['modifyvm', :id, '--nictype1', 'virtio']
    v.memory = 4096
  end
end
