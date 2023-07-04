#cloud-boothook
#!/bin/bash

# Install Ansible on Ubuntu
sudo apt update
sudo apt install -y ansible

# Add your local SSH public key to the authorized_keys file
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y >/dev/null 2>&1
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

# Ensure the SSH agent is running and add your private key
ssh -o StrictHostKeyChecking=no localhost echo "SSH connection successful!"

#Clone ansible playbooks from git repository
git clone https://github.com/Majid-dev/install-jenkins.git
cd install-jenkins

#Install Jenkins and apply required configuration
ansible-playbook install-jenkins.yml
ansible-playbook configure-jenkins.yml
