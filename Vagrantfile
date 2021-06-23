# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  
  # config.vm.provision :shell, path: "startup.sh"

  config.vm.define "ftlo" do |ftlo|
    ftlo.vm.box = "luminositylabsllc/centos7"
    ftlo.vm.hostname = "ftlo"
  end
  
  config.vm.define "ftnlo" do |ftnlo|
    ftnlo.vm.box = "luminositylabsllc/centos7"
	ftnlo.vm.hostname = "ftnlo"
  end
  
  config.vm.define "ftwps" do |ftwps|
    ftwps.vm.box = "luminositylabsllc/centos7"
	ftwps.vm.hostname = "ftwps"
  end
  
  config.vm.define "ntlo1" do |ntlo1|
    ntlo1.vm.box = "luminositylabsllc/centos7"
	ntlo1.vm.hostname = "ntlo1"
  end
  
  config.vm.define "ntlo2" do |ntlo2|
    ntlo2.vm.box = "luminositylabsllc/centos7"
	ntlo2.vm.hostname = "ntlo2"
  end
  
  config.vm.define "ntnlo1" do |ntnlo1|
    ntnlo1.vm.box = "luminositylabsllc/centos7"
	ntnlo1.vm.hostname = "ntnlo1"
  end
  
  config.vm.define "ntnlo2" do |ntnlo2|
    ntnlo2.vm.box = "luminositylabsllc/centos7"
	ntnlo2.vm.hostname = "ntnlo2"
  end
  
  config.vm.define "ntwps1" do |ntwps1|
    ntwps1.vm.box = "luminositylabsllc/centos7"
	ntwps1.vm.hostname = "ntwps1"
  end
  
  config.vm.define "ntwps2" do |ntwps2|
    ntwps2.vm.box = "luminositylabsllc/centos7"
	ntwps2.vm.hostname = "ntwps2"
  end
  
  config.vm.define "testlo1" do |testlo1|
    testlo1.vm.box = "luminositylabsllc/centos7"
	testlo1.vm.hostname = "testlo1"
  end
  
  config.vm.define "testlo2" do |testlo2|
    testlo2.vm.box = "luminositylabsllc/centos7"
	testlo2.vm.hostname = "testlo2"
  end
  
  config.vm.define "testnlo" do |testnlo|
    testnlo.vm.box = "luminositylabsllc/centos7"
	testnlo.vm.hostname = "testnlo"
  end
  
  config.vm.define "testwps" do |testwps|
    testwps.vm.box = "luminositylabsllc/centos7"
	testwps.vm.hostname = "testwps"
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
