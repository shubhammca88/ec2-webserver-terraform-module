resource "aws_instance" "ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  availability_zone      = var.availability_zone
  ami_key_pair           = var.key_name
  ami_public_key_path    = var.public_key_path
  subnet_id              = var.subnet_id.id
  vpc_security_group_ids = var.vpc_security_group_ids.id
  # Optionally, add vpc_id (for clarity or specific configurations)
  # root_block_device {
  #   volume_size = var.volume_size
  #   volume_type = var.volume_type
  #   encrypted   = var.encrypted
  # }
  # ebs_block_device {
  #   volume_size = var.volume_size
  #   volume_type = var.volume_type
  #   encrypted   = var.encrypted
  # }
  # ebs_optimized = var.ebs_optimized
  # monitoring = var.monitoring
  # iam_instance_profile = var.iam_instance_profile
  # associate_public_ip_address = var.associate_public_ip_address
  # ami_key_pair = var.key_name
  # ami_public_key_path = var.public_key_path
  associate_public_ip_address = true


  # ec2 instance configuration name
  tags = merge(var.tags, {
    Name        = var.instance_name
    Environment = var.environment
    Project     = var.project
    Owner       = "shubham"
    Created_by  = "terraform"
  })
}
