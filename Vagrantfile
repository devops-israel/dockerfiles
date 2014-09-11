ENV['VAGRANT_NO_PLUGINS'] = 'true'

VAGRANT_VBOX_MEMORY = ENV.fetch 'VBOX_MEMORY', '2048'
VAGRANT_VBOX_CPUS   = ENV.fetch 'VBOX_CPUS', '2'
VAGRANT_VBOX_NET    = ENV.fetch 'VBOX_NET', '172.16.0.0/24'
VAGRANT_VBOX_IP     = ENV.fetch 'VBOX_IP', '172.19.69.15'
VAGRANT_VBOX_NAME   = ENV.fetch 'VBOX_NAME', 'boot2docker'

# don't load any vagrant plugins
ENV['VAGRANT_NO_PLUGINS'] = 'true'

Vagrant.configure('2') do |v|
  v.vm.box = "yungsang/boot2docker"
  v.vm.box_check_update = false
  v.vm.network :private_network, ip: VAGRANT_VBOX_IP

  v.vm.provider :virtualbox do |vb|
    vb.memory = VAGRANT_VBOX_MEMORY
    vb.cpus   = VAGRANT_VBOX_CPUS
    vb.name   = VAGRANT_VBOX_NAME
    vb.customize [ "modifyvm", :id, "--natnet1", VAGRANT_VBOX_NET ]
  end

  # mount puppet into boot2docker at /vagrant/puppet
  if File.directory?(File.join(File.dirname(__FILE__), 'puppet'))
    if Vagrant::Util::Platform.windows?
      v.vm.synced_folder 'puppet', '/vagrant/puppet'
    else
      v.vm.synced_folder 'puppet', '/vagrant/puppet', nfs: true, mount_options: ['nolock,vers=3,udp']
    end
  end
end

class Vagrant::Action::Builtin::WaitForCommunicator
  def call(env); end # do nothing!
end
