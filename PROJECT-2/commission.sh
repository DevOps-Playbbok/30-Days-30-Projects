#!/bin/bash

# Path to your Terraform configuration directory
TERRAFORM_DIR="./terraform"

# Function to check for Terraform installation
check_terraform() {
    if ! command -v terraform &> /dev/null; then
        echo "Error: Terraform is not installed. Please install it and try again."
        exit 1
    fi
}

# Function to initialize Terraform
terraform_init() {
    echo "Initializing Terraform..."
    terraform init $TERRAFORM_DIR
}

# Function to create a Terraform plan
terraform_plan() {
    echo "Creating Terraform plan..."
    terraform plan -out=tfplan $TERRAFORM_DIR
}

# Function to apply Terraform plan
terraform_apply() {
    echo "Applying Terraform plan..."
    terraform apply -auto-approve tfplan
}
