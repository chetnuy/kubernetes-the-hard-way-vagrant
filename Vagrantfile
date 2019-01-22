# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu1804"
  config.vm.synced_folder ".", "/vagrant"

  config.vm.provider "libvirt" do |vb|
    vb.memory = "512"
  end

# must be at the top
  config.vm.define "lb" do |c|
      c.vm.hostname = "lb"
      c.vm.network "private_network", ip: "192.168.121.40"
      c.vm.provision :shell, :path => "scripts/vagrant-setup-haproxy.bash"
      c.vm.provider "libvirt" do |vb|
        vb.memory = "512"
      end
  end


    config.vm.define "controller" do |c|
        c.vm.hostname = "controller"
        c.vm.network "private_network", ip: "192.168.121.10"
        c.vm.provision :shell, :path => "scripts/vagrant-setup-hosts-file.bash"
        c.vm.provider "libvirt" do |vb|
          vb.memory = "640"
        end
    end


  (0..1).each do |n|
    config.vm.define "worker-#{n}" do |c|
        c.vm.hostname = "worker-#{n}"
        c.vm.network "private_network", ip: "192.168.121.2#{n}"

        c.vm.provision :shell, :path => "scripts/vagrant-setup-routes.bash"
        c.vm.provision :shell, :path => "scripts/vagrant-setup-hosts-file.bash"
    end
  end

    config.vm.define "traefik-0", autostart: false do |c|
        c.vm.hostname = "traefik-0"
        c.vm.network "private_network", ip: "192.168.121.39"
        c.vm.provision :shell, :path => "scripts/vagrant-setup-routes.bash"
    end
end
