module "webserver_ec2" {
  source                 = "./modules/ec2-module"
  ami_id                 = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  public_key_path        = var.public_key_path
  availability_zone      = var.availability_zone
  vpc_security_group_ids = var.vpc_security_group_ids.ec2_sg.id
  subnet_id              = module.vpc.public_subnet.id
  vpc_id                 = module.vpc.vpc_id

  instance_name = var.instance_name
  tags          = var.tags
  environment   = var.environment
  project       = var.project
}
