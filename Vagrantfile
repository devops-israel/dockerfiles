# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_LOG'] = 'debug'
ENV['VAGRANT_NO_PLUGINS'] = 'true'
VAGRANT_VBOX_MEMORY = ENV.fetch 'VBOX_MEMORY', '2048'

Vagrant.configure("2") do |v|
  v.vm.box = "coreos-alpha"
  v.vm.box_url = "http://alpha.release.core-os.net/amd64-usr/current/coreos_production_vagrant.json"
  v.vm.box_version = ">= 308.0.1"
  v.vm.define :dockerhost do |b|
    b.vm.network "forwarded_port", guest: 4243, host: 4243, auto_correct: true
    b.vm.network :private_network, ip: "172.17.8.101"
    b.vm.synced_folder '.', '/home/core/share', id: 'core', nfs: true, mount_options: ['nolock,vers=3,udp']
  end
  v.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", VAGRANT_VBOX_MEMORY]
  end
end
