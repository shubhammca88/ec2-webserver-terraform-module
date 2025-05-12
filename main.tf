module "webserver_ec2" {
  source        = "./modules/ec2-module"
  ami_id        = var.ami_id # replace with your AMI
  instance_type = var.instance_type
  name          = var.environment
  project       = var.project
  tags          = var.tags
  public_key_path = var.public_key_path
  availability_zone = var.availability_zone
}