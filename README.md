# Terraform AWS Infrastructure

This repository contains Terraform IaC for building reusable AWS infrastructure components and deploying them across multiple environments (dev, stage, prod).

## Folder Structure

- `global/` → provider settings, versions, global variables
- `modules/` → reusable Terraform modules (vpc, ec2, rds, etc.)
- `environments/` → actual deployments per environment

## How to Use

cd environments/dev
terraform init
terraform plan
terraform apply


