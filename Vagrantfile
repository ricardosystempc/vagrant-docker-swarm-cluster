
Vagrant.configure("2") do |config|

  # Imagem base das máquinas virtuais
  config.vm.box = "ubuntu/jammy64"

  # Desabilita a pasta compartilhada padrão
  config.vm.synced_folder ".", "/vagrant",
    disabled: true

  # Configuração do nó Manager
  config.vm.define "master" do |master|
    master.vm.hostname = "master"
    master.vm.network "private_network",
      ip: "192.168.56.10"

    master.vm.provider "virtualbox" do |vb|
      vb.name = "master"
      vb.memory = 1024
      vb.cpus = 1
    end

    master.vm.provision "shell", inline: <<-SHELL
      set -e

      apt-get update
      apt-get install -y docker.io

      systemctl enable --now docker

      if [ "$(docker info --format '{{.Swarm.LocalNodeState}}')" != "active" ]; then
        docker swarm init --advertise-addr 192.168.56.10
      fi

      docker swarm join-token -q worker > /tmp/worker-token
    SHELL
  end

  # Configuração dos nós Workers
  {
    "node01" => "192.168.56.11",
    "node02" => "192.168.56.12",
    "node03" => "192.168.56.13"
  }.each do |node_name, node_ip|

    config.vm.define node_name do |node|
      node.vm.hostname = node_name
      node.vm.network "private_network", ip: node_ip

      node.vm.provider "virtualbox" do |vb|
        vb.name = node_name
        vb.memory = 1024
        vb.cpus = 1
      end

      node.vm.provision "shell", inline: <<-SHELL
        set -e

        apt-get update
        apt-get install -y docker.io

        systemctl enable --now docker

        # Aguarda o Manager disponibilizar o token
        until ssh -o ConnectTimeout=2 \
          -o StrictHostKeyChecking=no \
          -o UserKnownHostsFile=/dev/null \
          vagrant@192.168.56.10 \
          "sudo cat /tmp/worker-token" \
          > /tmp/worker-token 2>/dev/null; do
          sleep 5
        done

        TOKEN=$(cat /tmp/worker-token)

        if [ "$(docker info --format '{{.Swarm.LocalNodeState}}')" != "active" ]; then
          docker swarm join \
            --token "$TOKEN" \
            192.168.56.10:2377
        fi
      SHELL
    end
  end
end
