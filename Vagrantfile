
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"
  # provisioning for bash script
  config.vm.provision "shell", path: "environment/provision.sh"
  config.vm.network "private_network", ip: "192.168.10.100"
  config.hostsupdater.aliases = ["eng42.local"]

  # synced app folder
  config.vm.synced_folder "node-sample-app", "/node-sample-app"


end
