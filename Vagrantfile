# -*- mode: ruby -*-
# vi: set ft=ruby :
BOX_MACHINE="centos/7"

Vagrant.configure("2") do |config|
  (1..1).each do |i|
    config.vm.define "ansible-#{i}" do |subconfig|
      subconfig.vm.box = BOX_MACHINE
      subconfig.vbguest.installer_options = {allow_kernel_upgrade: true}
      subconfig.vm.hostname = "ansible-#{i}"
      subconfig.vm.network "private_network", ip: "192.168.33.10#{i}"
      subconfig.vm.provider "virtualbox" do |vb|
        vb.memory = 6000
      end
      subconfig.vm.provision "shell", path: "script_ansible"
      subconfig.vm.provision "file", source: "./keys/id_rsa", destination:"/home/vagrant/.ssh/id_rsa"
    end 
  end


  (1..2).each do |i|
    config.vm.define "dev-#{i}" do |subconfig|
      subconfig.vm.box = "ubuntu/xenial64"
      subconfig.vm.hostname = "dev-#{i}"
      subconfig.vbguest.installer_options = {allow_kernel_upgrade: true}
      subconfig.vm.network "private_network", ip: "192.168.33.11#{i}"
      subconfig.vm.provider "virtualbox" do |vb|
        vb.memory = 3000
      end
      subconfig.vm.provision "file", source: "./keys/id_rsa.pub", destination: "/tmp/"
      subconfig.vm.provision "shell", inline: "mv /tmp/id_rsa.pub /home/vagrant/.ssh/authorized_keys"
    end
  end

#  (1..1).each do |i|
#    config.vm.define "jenkins" do |subconfig|
#      subconfig.vm.box = "centos/7"
#      subconfig.vbguest.installer_options = {allow_kernel_upgrade: true}
#      subconfig.vm.hostname = "jenkins-#{i}"
#      subconfig.vm.network "private_network", ip: "192.168.33.22#{i}"
#      subconfig.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"
#      subconfig.vm.provider "virtualbox" do |vb|
#        vb.cpus = 2
#        vb.memory = 8000
#      end
#    end
#  end
end
