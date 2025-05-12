resource "aws_instance" "this" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  availability_zone = var.availability_zone

  tags = merge(var.tags, {
    Name        = var.name
    environment = var.environment
    project     = var.project
  })
}
