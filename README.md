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
- AWS CLI configured with appropriate credentials
- Terraform installed (>= 1.0.0)
- Git installed
- Basic understanding of AWS services
- Text editor (VSCode, Sublime, etc.)

## Terraform Variables (terraform.tfvars)
The following variables can be customized in your terraform.tfvars file:

### EC2 Configuration
```hcl
ami_id          = "ami-03f4878755434977f"  # Ubuntu AMI
instance_type   = "t2.micro"                # Instance size
key_name        = "webserver-key"           # SSH key name
public_key_path = "./id_rsa.pub"           # Path to public key
```

### Network Configuration
```hcl
availability_zone  = "ap-south-1a"          # AZ for deployment
public_subnet_cidr = "10.0.1.0/24"         # Public subnet CIDR
```

### Security Configuration
```hcl
allowed_ports = [
  {
    from_port   = 22    # SSH
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 80    # HTTP
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 443   # HTTPS
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]
```

### Storage Configuration
```hcl
volume_size = 20        # Size in GB
volume_type = "gp2"     # Volume type
encrypted   = true      # Enable encryption
```

## Step-by-Step Deployment Guide

### 1. Repository Setup
```bash
# Clone the repository
git clone https://github.com/yourusername/ec2-webserver-terraform-module.git

# Navigate to project directory
cd ec2-webserver-terraform-module

# Create a new branch (optional)
git checkout -b my-deployment
```

### 2. AWS Configuration
```bash
# Configure AWS CLI (if not already configured)
aws configure
# Enter your:
# - AWS Access Key ID
# - AWS Secret Access Key
# - Default region (e.g., ap-south-1)
# - Output format (json)
```

### 3. SSH Key Generation
```bash
# Generate SSH key pair
ssh-keygen -t rsa -b 4096 -f ./id_rsa
# This creates:
# - id_rsa (private key)
# - id_rsa.pub (public key)

# Set proper permissions
chmod 400 id_rsa
```

### 4. Configure Variables
```bash
# Copy example tfvars file
cp terraform.tfvars.example terraform.tfvars

# Edit terraform.tfvars with your values
# Use any text editor, e.g.:
vim terraform.tfvars
# or
code terraform.tfvars
```

### 5. Initialize and Deploy
```bash
# Initialize Terraform
terraform init

# Format and validate code
terraform fmt
terraform validate

# Review the deployment plan
terraform plan

# Apply the configuration
terraform apply

# Confirm by typing 'yes'
```

### 6. Access Your Web Server
After successful deployment, you'll see outputs including:
- Public IP address
- Instance ID
- Security Group ID

```bash
# SSH access
ssh -i id_rsa ubuntu@<public_ip>

# Web access
http://<public_ip>
```

### 7. Monitoring and Maintenance
```bash
# View resource states
terraform show

# List all resources
terraform state list

# Check outputs
terraform output
```

### 8. Making Changes
```bash
# Edit terraform.tfvars for any changes
vim terraform.tfvars

# Apply changes
terraform plan
terraform apply
```

### 9. Cleanup
```bash
# Destroy all resources when done
terraform destroy

# Confirm by typing 'yes'
```

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

## Security Features
- SSH access restricted to key pair authentication
- HTTPS enabled
- EBS volume encryption
- Custom VPC with public subnet
- Security group with minimal required ports

## Best Practices
1. Always use version control
2. Keep sensitive data out of version control
3. Use meaningful tags for resources
4. Regularly update AMIs and security patches
5. Follow the principle of least privilege
6. Encrypt sensitive data and volumes
7. Use meaningful variable names
8. Document all customizations

## Troubleshooting
Common issues and solutions:

1. **SSH Connection Issues**
   - Verify security group rules
   - Check key pair permissions (chmod 400)
   - Confirm public IP is correct

2. **NGINX Not Accessible**
   - Verify instance is running
   - Check security group allows port 80/443
   - Review NGINX service status

3. **Terraform Apply Fails**
   - Verify AWS credentials
   - Check resource name conflicts
   - Review error messages in detail

## Contributing
1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## Support
For support, please open an issue in the GitHub repository.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

---
Made with ❤️ by shubham