variable "ami_id" {
  description = "AMI ID to launch"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}
variable "availability_zone" {
  description = "Availability zone for the instance"
  type        = string
  default     = "ap-south-1a" # Replace with your desired availability zone
  
}
variable "name" {
  description = "Name tag for the instance"
  type        = string
  default     = "ec2-instance"
}
variable "project" {
  description = "Project name"
  type        = string
}
 variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
 }
 variable "tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
  default     = {
    Name        = var.name
    Environment = var.environment
    Project     = var.project
  }
   
 }
variable "key_name" {
  description = "Name of the key pair to use for SSH access"
  type        = string
  default     = "webserver-key" # Replace with your actual key name
}
variable "public_key_path" {
  description = "Path to the public key file"
  type        = string

}