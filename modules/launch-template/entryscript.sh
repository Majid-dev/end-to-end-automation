#!/bin/bash

#Clone ansible playbooks from git repository
git clone https://github.com/Majid-dev/install-jenkins.git
cd install-jenkins

#Install Jenkins and apply required configuration
ansible-playbook install-jenkins.yml
ansible-playbook configure-jenkins.yml
