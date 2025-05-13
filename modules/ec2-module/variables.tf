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
  default     = "ap-south-1a"
}

variable "instance_name" {
  description = "Name tag for the instance"
  type        = string
}

variable "environment" {
  description = "Environment tag for the instance"
  type        = string
}

variable "project" {
  description = "Project tag for the instance"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
}

variable "key_name" {
  description = "Name of the key pair to use for SSH access"
  type        = string
  default     = "webserver-key"
}

variable "public_key_path" {
  description = "Path to the public key file"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "volume_size" {
  description = "Size of the root volume in GiB"
  type        = number
  default     = 20
}

variable "volume_type" {
  description = "Type of the root volume"
  type        = string
  default     = "gp2"
}

variable "encrypted" {
  description = "Whether to encrypt the root volume"
  type        = bool
  default     = false
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the instance"
  type        = bool
  default     = true
}

variable "root_block_device" {
  description = "Root block device configuration"
  type        = map(string)
  default = {
    volume_size = "20"
    volume_type = "gp2"
    encrypted   = "false"
  }
}
variable "ebs_block_device" {
  description = "EBS block device configuration"
  type        = list(map(string))
  default     = []
}
variable "ebs_optimized" {
  description = "Whether the instance is EBS optimized"
  type        = bool
  default     = false
}
variable "monitoring" {
  description = "Whether to enable detailed monitoring"
  type        = bool
  default     = false
}
variable "iam_instance_profile" {
  description = "IAM instance profile to associate with the instance"
  type        = string
  default     = ""
}
variable "user_data" {
  description = "User data script to run on instance launch"
  type        = string
  default     = ""
}
variable "allowed_ports" {
  description = "List of allowed ports for the security group"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default     = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },]
}
