data "aws_ami" "demo_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_launch_template" "template" {
  name_prefix   = "launch_template"
  image_id      = data.aws_ami.demo_ami.id
  instance_type = var.instance_type
  user_data = filebase64(var.user_data_file)
  key_name = "jenkins-key"
  network_interfaces {
    security_groups = var.security_group_ids
    associate_public_ip_address = true
  }
 
}