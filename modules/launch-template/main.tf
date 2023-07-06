
data "aws_ami" "my_ami" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["ansible-ami"]
  }
}
data "template_file" "test" {
  template = <<EOF
#!/bin/bash
git clone https://github.com/Majid-dev/install-jenkins.git
cd install-jenkins
ansible-playbook install-jenkins.yml
ansible-playbook configure-jenkins.yml
EOF
}
resource "aws_launch_template" "template" {
  name_prefix   = "launch_template"
  image_id      = data.aws_ami.my_ami.id
  instance_type = var.instance_type
  user_data = base64encode(data.template_file.test.rendered)
  key_name = "jenkins-key"
  network_interfaces {
    security_groups = var.security_group_ids
    associate_public_ip_address = true
  }
 
}