hosts = {
	"vm-control-node" => "192.168.4.211"
}

Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/jammy64"
	config.vm.box_check_update = false
	config.ssh.insert_key = false
	config.ssh.forward_agent = true
    check_guest_additions = false
    functional_vboxsf = false
	hosts.each do |name, ip|
		config.vm.define name do |machine|
			#machine.vm.network :private_network, ip: ip
			machine.vm.network :public_network, bridge: "TP-Link Wireless USB Adapter", ip: ip
			machine.vm.hostname = name
			machine.vm.provider "virtualbox" do |v|
				v.name = name
				v.gui = false
				v.memory = "1024"
				v.cpus = 1
			end
		end
	end
	config.vm.provision "shell", inline: <<-SHELL
		sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config    
		service ssh restart
		apt-get update && apt-get upgrade -y
		apt-get install ansible -y
		git clone https://github.com/nsrusin/otus.git
		chown vagrant: ~/otus
		SHELL
end
