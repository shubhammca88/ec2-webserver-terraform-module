# EC2 Web Server Terraform Module

Terraform module to deploy an EC2 instance with NGINX web server.

## Features
- Modular Terraform design
- Custom VPC and subnet
- Security group with configurable ports
- Automated NGINX installation
- SSH key pair management

## Quick Start

1. **Generate SSH key**
```bash
ssh-keygen -t rsa -b 4096 -f ./id_rsa
```

2. **Create terraform.tfvars**
```hcl
ami_id          = "ami-03f4878755434977f"  # Ubuntu AMI
instance_type   = "t2.micro"
key_name        = "webserver-key"
public_key_path = "./id_rsa.pub"
instance_name   = "webserver"
environment     = "dev"
project         = "demo"
```

3. **Deploy**
```bash
terraform init
terraform plan
terraform apply
```

4. **Access**
```bash
# SSH
ssh -i id_rsa ubuntu@<public_ip>

# Web
http://<public_ip>
```

## What You Get
- EC2 instance with NGINX web server
- Custom VPC with public subnet
- Security group allowing SSH and HTTP
- Automatic NGINX installation

## Requirements
- AWS CLI configured
- Terraform installed
- SSH key pair

## Cleanup
```bash
terraform destroy
```