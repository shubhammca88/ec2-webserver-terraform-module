#!/bin/bash

# Update system packages
sudo apt-get update
sudo apt-get upgrade -y

# Install NGINX
sudo apt-get install -y nginx

# Start NGINX and enable it on boot
sudo systemctl start nginx
sudo systemctl enable nginx

# Create a custom index page
cat << EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to EC2 Web Server</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            max-width: 800px;
            margin: 0 auto;
        }
        h1 {
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Your EC2 Web Server!</h1>
        <p>This server was provisioned using Terraform.</p>
        <p>Instance Details:</p>
        <ul>
            <li>Hostname: $(hostname)</li>
            <li>Instance Type: $(curl -s http://169.254.169.254/latest/meta-data/instance-type)</li>
            <li>Availability Zone: $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)</li>
        </ul>
    </div>
</body>
</html>
EOF

# Restart NGINX to apply changes
sudo systemctl restart nginx