# EC2 Web Server Deployment Module (Terraform)

## Description
This project uses Terraform to provision a secure EC2 instance running a web server (NGINX). It follows best practices including modular design, user data provisioning, and security group management.

## AWS Services Used
- EC2
- VPC
- Security Groups
- IAM (for key pair usage)

## Features
- Custom AMI and instance type
- Public IP output
- User data script to install NGINX
- Auto-generated security group (SSH, HTTP, HTTPS)
- Fully modular Terraform structure

## File Structure
```
.
├── main.tf
├── variables.tf
├── outputs.tf
├── versions.tf
├── install-nginx.sh
├── ec2-module/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
```

## Usage

1. Create a `terraform.tfvars` file:
```hcl
ami_id                  = "ami-xxxxxxxx"
instance_type           = "t2.micro"
key_name                = "your-key-pair-name"
vpc_security_group_ids  = []
subnet_id               = "subnet-xxxxxxxx"
vpc_id                  = "vpc-xxxxxxxx"
environment             = "dev"
```

2. Run Terraform commands:
```bash
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

3. SSH into your instance:
```bash
ssh -i your-key.pem ubuntu@<public_ip>
```

## Notes
- Ensure the key pair exists in your AWS account.
- Change `install-nginx.sh` if you prefer Apache.

---