# Terraform EC2 Instance Setup

This repository contains Terraform code to set up an EC2 instance on AWS, which hosts an Nginx server.

## Prerequisites

- Terraform installed on your local machine
- AWS CLI installed and configured with your AWS credentials
- An existing key pair in the specified AWS region (`us-east-2`)

## Steps to Execute the Terraform Code

1. **Clone the repository:**

   ```bash
   git clone https://github.com/samundra77/samundra--labs.git
   cd samundra--labs

2. Checkout to the "friday" branch:
git checkout friday

3. Initialize the Terraform configuration:
terraform init

4. Plan the Terraform deployment:
terraform plan

5. Apply the Terraform deployment:
terraform apply

6. To destroy the resources created by Terraform, run:
terraform destroy 
