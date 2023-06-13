#!/bin/bash

sleep 10
sudo yum update -y

# sudo groupadd -r admin
# sudo useradd -m -s /bin/bash terraform
# sudo usermod -a -G admin terraform

# sudo cp /etc/sudoers /etc/sudoers.orig


# echo "admin  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/admin
# echo "terraform  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers

# sleep 10

# sudo mkdir -p /home/terraform/.ssh
# sudo mkdir /home/terraform/.ssh
# sudo chmod 700 /home/terraform/.ssh
# sudo cp /tmp/tf_ssh.pub /home/terraform/.ssh/authorized_keys
# sudo chmod 600 /home/terraform/.ssh/authorized_keys
# sudo chown -R terraform /home/terraform/.ssh
# sudo usermod --shell /bin/bash terraform

sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
sudo bash -c 'source ~/.nvm/nvm.sh && sudo nvm install 16'
sudo nvm install 16

sudo yum install nodejs


sudo yum install -y git
sudo git clone https://github.com/saeedlk/infra-terraform
sudo mkdir slk-test && cd slk-test && sudo touch test2.lk
# sudo cd slk-test
sudo touch test.lk

# sudo cd ws-tunnel-server/ws-tunnel-server/
# node index.js 