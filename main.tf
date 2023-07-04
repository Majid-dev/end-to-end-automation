module "vpc" {
  source                 = "./modules/vpc"
  region                 = var.region
  project_name           = var.project_name
  environment            = var.environment
  vpc_cidr               = var.vpc_cidr
  public_subnet_az1_cidr = var.public_subnet_az1_cidr
  public_subnet_az2_cidr = var.public_subnet_az2_cidr
}


# module "security-group" {
#   source = "./modules/security-group"
#   vpc_id = module.vpc.vpc_id
# }

# module "launch-template" {
#   source             = "./modules/launch-template"
#   instance_type      = var.instance_type
#   user_data_file     = var.user_data_file
#   security_group_ids = [module.security-group.webserver-security-group_id]
# }

# module "target_group" {
#   source            = "./modules/target-group"
#   project_name      = var.project_name
#   vpc_id            = module.vpc.vpc_id
#   health_check_path = var.health_check_path
#   tg_port           = var.tg_port
#   tg_protocol       = var.tg_protocol
#   tg_target_type    = var.tg_target_type
# }

# module "alb" {
#   source                 = "./modules/alb"
#   project_name           = var.project_name
#   alb_security_group_ids = [module.security-group.alb-security-group_id]
#   alb_subnet_ids         = [module.vpc.public_subnet_az1_id, module.vpc.public_subnet_az2_id]
#   target_group_arn       = module.target_group.target_group_arn
# }

# module "asg" {
#   source             = "./modules/asg"
#   project_name       = var.project_name
#   target_group_arn   = module.target_group.target_group_arn
#   subnet_ids         = [module.vpc.public_subnet_az1_id, module.vpc.public_subnet_az2_id]
#   launch_template_id = module.launch-template.launch_template_id
#   desired_capacity   = var.desired_capacity
#   max_size           = var.max_size
#   min_size           = var.min_size
# }
