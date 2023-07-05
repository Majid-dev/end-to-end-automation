
resource "aws_launch_template" "template" {
  name_prefix   = "launch_template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  user_data = <<EOF
   #!/bin/bash
   git clone https://github.com/Majid-dev/install-jenkins.git
   cd install-jenkins
   ansible-playbook install-jenkins.yml
   ansible-playbook configure-jenkins.yml
   EOF

  key_name = "jenkins-key"
  network_interfaces {
    security_groups = var.security_group_ids
    associate_public_ip_address = true
  }
 
}