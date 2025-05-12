output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.ec2.id
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.ec2.public_ip
}
output "private_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.ec2.private_ip
}
output "instance_name" {
  description = "Name of the EC2 instance"
  value       = aws_instance.ec2.tags["Name"]
}
output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.ec2_sg.id
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}
output "subnet_id" {
  description = "ID of the subnet"
  value       = aws_subnet.public_subnet.id
}