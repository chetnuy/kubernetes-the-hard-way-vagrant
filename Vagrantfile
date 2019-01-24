# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
  end


    config.vm.define "controller" do |c|
        c.vm.hostname = "controller"
        c.vm.network "private_network", ip: "192.168.121.10"
        c.vm.provision :shell, :path => "scripts/vagrant-setup-hosts-file.bash"
        c.vm.provision :shell, :path => "scripts/vagrant-setup-routes.bash"
    end


    config.vm.define "worker" do |c|
        c.vm.hostname = "worker"
        c.vm.network "private_network", ip: "192.168.121.20"
        c.vm.provision :shell, :path => "scripts/vagrant-setup-routes.bash"
        c.vm.provision :shell, :path => "scripts/vagrant-setup-hosts-file.bash"
    end
end
