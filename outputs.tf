output "name" {
  description = "Name of the EC2 instance"
  value       = module.webserver_ec2.instance_name
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.webserver_ec2.instance_id
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.webserver_ec2.public_ip
}

output "private_ip" {
  description = "Private IP of the EC2 instance"
  value       = module.webserver_ec2.private_ip
}

output "security_group_id" {
  description = "ID of the security group"
  value       = module.webserver_ec2.security_group_id
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.webserver_ec2.vpc_id
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = module.webserver_ec2.subnet_id
}
