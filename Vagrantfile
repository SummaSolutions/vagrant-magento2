VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "puphpet/debian75-x64"

  config.vm.provision :shell, :inline => "echo 'export LC_CTYPE=\"en_US.UTF-8\"' >> /home/vagrant/.bashrc"
  config.vm.provision :shell, :path => "bin/bootstrap.sh"
  config.vm.provision :shell, :path => "bin/init.sh", :privileged => false
  
  config.ssh.shell = "bash -l"

  config.ssh.username = "vagrant"
  config.ssh.keep_alive = true
  config.ssh.forward_agent = false
  config.ssh.forward_x11 = false
  config.vagrant.host = :detect

  config.vm.synced_folder ".", "/vagrant", type: "nfs"

	# load local customizations if available
	_local = File.dirname(__FILE__) + '/Vagrantfile.local'
	if File.exists?(_local) and File.readable?(_local)
		eval(IO.read(_local))
	end
end