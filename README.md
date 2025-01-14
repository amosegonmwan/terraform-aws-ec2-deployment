# Terraform AWS Infrastructure Setup on EC2

## This project automates the deployment of a web server on AWS EC2 using Terraform. The web server runs Amazon Linux 2, with httpd installed to serve a simple HTTP page. It also creates a security group allowing SSH and HTTP traffic.

## Table of Contents
1. [Project Title](#project-title)
2. [Project Description](#project-description)
3. [Prerequisites](#prerequisites)
4. [Architecture Overview](#architecture-overview)
5. [Technologies Used](#technologies-used)
6. [Getting Started](#getting-started)
7. [Variables](#variables)
8. [Outputs](#outputs)
9. [Usage](#usage)
10. [Contributing](#contributing)
11. [License](#license)

## Prerequisites
- Terraform installed
- AWS account with appropriate IAM permissions
- SSH key pair for EC2 access

## Architecture Overview
The project leveruses the following Terraform configuration files:

1. **`provider.tf`**
   - Configures the AWS provider and sets the region for resource deployment.
   - Specifies the AWS provider version (`~> 5.0`).

2. **`data.tf`**
   - Defines a data source to fetch the latest Amazon Linux 2 AMI (Amazon Machine Image).
   - Applies filters to ensure the AMI is `hvm`-compatible and uses an `EBS` root device.

3. **`main.tf`**
   - **Security Group**: Creates a security group (`dev-web-sg`) to allow:
     - SSH (port 22) access from all IPs.
     - HTTP (port 80) traffic from all IPs.
   - **EC2 Instance**: Provisions an Amazon Linux 2 EC2 instance with the following configurations:
     - Uses the fetched AMI ID.
     - Attaches the security group created above.
     - Installs and starts Apache HTTP Server.
     - Displays a welcome message on the server’s home page.

4. **`variables.tf`**
   - Defines input variables to make the deployment customizable:
     - AWS region (`aws_region`)
     - EC2 instance type (`instance_type`)
     - Security group tag name (`sg-tag-name`)
     - EC2 instance tag name (`ec2-tag-name`)

5. **`output.tf`**
   - Outputs:
     - **AMI ID**: The Amazon Linux AMI ID used for the EC2 instance.
     - **HTTP URL**: The public URL to access the web server.

This infrastructure deploys:
- An EC2 instance configured as a web server.
- A security group to manage incoming and outgoing traffic.


## Technologies Used
- **AWS EC2**: Hosting the web server.
- **Amazon Linux 2**: Operating system for EC2.
- **Terraform**: Infrastructure as Code (IaC) tool.
- **Apache HTTP Server**: Web server software.

## Getting Started
1. Clone the repo:
   ```bash
   git clone <repository-url>
   cd <repo-dir>
   ```