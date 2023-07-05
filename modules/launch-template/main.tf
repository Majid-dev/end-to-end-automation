
resource "aws_launch_template" "template" {
  name_prefix   = "launch_template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  user_data = filebase64(var.user_data_file)
  key_name = "jenkins-key"
  network_interfaces {
    security_groups = var.security_group_ids
    associate_public_ip_address = true
  }
 
}