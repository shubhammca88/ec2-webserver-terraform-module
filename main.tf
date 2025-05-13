module "webserver_ec2" {
  source            = "./modules/ec2-module"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  public_key_path   = var.public_key_path
  availability_zone = var.availability_zone

  public_subnet_cidr = var.public_subnet_cidr
  allowed_ports      = var.allowed_ports

  instance_name = var.instance_name
  tags          = var.tags
  environment   = var.environment
  project       = var.project
}
