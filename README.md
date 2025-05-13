# EC2 NGINX Web Server Module (Terraform)

## Description
This project uses Terraform to provision a secure EC2 instance running an NGINX web server. It follows best practices including modular design, user data provisioning, and security group management.

## AWS Services Used
- EC2 (Elastic Compute Cloud)
- VPC (Virtual Private Cloud)
- Security Groups
- IAM (for key pair management)

## Features
- Automated NGINX installation and configuration
- Custom AMI and instance type selection
- Public IP assignment for web access
- User data script for NGINX setup
- Auto-generated security group (SSH, HTTP, HTTPS)
- Fully modular Terraform structure
- Encrypted EBS volumes
- Custom VPC and subnet configuration

## Prerequisites
- AWS CLI configured
- Terraform installed (>= 1.0.0)
- SSH key pair for EC2 access

## File Structure
```
.
├── main.tf                 # Main Terraform configuration
├── variables.tf            # Variable definitions
├── outputs.tf             # Output definitions
├── versions.tf            # Provider and version constraints
├── terraform.tfvars       # Variable values
├── install-nginx.sh       # NGINX installation script
└── modules/
    └── ec2-module/
        ├── main.tf        # EC2 instance configuration
        ├── variables.tf   # Module variables
        ├── outputs.tf     # Module outputs
        └── network.tf     # VPC and networking configuration
```

## Usage

1. Clone the repository:
```bash
git clone <repository-url>
cd ec2-webserver-terraform-module
```

2. Generate SSH key pair:
```bash
ssh-keygen -t rsa -b 4096 -f ./id_rsa
```

3. Initialize Terraform:
```bash
terraform init
```

4. Review and apply the configuration:
```bash
terraform plan
terraform apply
```

5. Access your web server:
```bash
# SSH access
ssh -i id_rsa ubuntu@<public_ip>

# Web access
http://<public_ip>
```

## Security Features
- SSH access restricted to key pair authentication
- HTTPS enabled
- EBS volume encryption
- Custom VPC with public subnet
- Security group with minimal required ports

## Cleanup
To destroy all resources:
```bash
terraform destroy
```

## Notes
- The default AMI is Ubuntu-based
- NGINX is installed via user data script
- Default instance type is t2.micro (free tier eligible)
- All EBS volumes are encrypted by default

## Contributing
Feel free to submit issues and enhancement requests!