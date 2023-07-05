#environment variables
region       = "us-east-1"
project_name = "jupiter"
environment  = "production"

#VPC variables

vpc_cidr               = "10.0.0.0/16"
public_subnet_az1_cidr = "10.0.1.0/24"
public_subnet_az2_cidr = "10.0.2.0/24"



#launch template variables
instance_type  = "t2.micro"
user_data_file = "./modules/launch-template/entryscript.sh"
ami_id         = "ami-02162048bb99afe0b"

#target group variables
health_check_path = "/login"
tg_port           = 8080
tg_protocol       = "HTTP"
tg_target_type    = "instance"

#auto scaling group variables
desired_capacity = 1
max_size         = 1
min_size         = 1