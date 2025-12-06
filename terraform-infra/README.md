# Terraform AWS Multi-Environment Infrastructure

This repository contains reusable **Terraform Infrastructure as Code (IaC)** for provisioning AWS environments:

- **dev**
- **stage**
- **prod**

Each environment uses a separate **remote backend state**, stored in:

- **S3** → Terraform state storage  
- **DynamoDB** → State locking to prevent corruption  

---

## Project Goals

- Consistent and repeatable multi-environment AWS deployments  
- Reusable Terraform modules (**VPC**, **EC2**, **S3**, **DynamoDB**)  
- Secure remote backend configuration  
- Strict environment isolation (dev / stage / prod)  
- Parameterized variables for flexibility  

---

## Folder Structure

```
terraform-infra/
├── global/
│   └── backend/          # Remote backend bootstrap (S3 + DynamoDB)
│
├── modules/              # Reusable modules (VPC, EC2, S3, DynamoDB)
│   ├── vpc/
│   ├── ec2/
│   ├── s3/
│   └── dynamodb/
│
└── envs/                 # Environment deployments
    ├── dev/
    ├── stage/
    └── prod/
```

---

## Remote Backend (S3 + DynamoDB)

The backend **must be created first**.

```
cd global/backend
# Update terraform.tfvars with bucket name + DynamoDB table name

terraform init
terraform apply
```

This provisions:

- **S3 Bucket** → Stores Terraform state files  
- **DynamoDB Table** → Manages state locking (prevents simultaneous updates)  

---

## Deploying an Environment

### Example: **DEV environment**

```
cd envs/dev

# Update terraform.tfvars:
# ssh_key_name     = "<your-key>"
# ssh_allowed_cidr = "<your-ip>/32"

terraform init
terraform apply
```

Repeat the same steps for:

```
envs/stage
envs/prod
```

Each environment manages its **own isolated infra + state**.

---

## Modules Included

### **1. VPC Module**
Creates:
- VPC  
- Public subnets  
- Internet Gateway  
- Route Table  

---

### **2. EC2 Module**
Creates:
- Ubuntu EC2 instance  
- Security Group:
  - SSH → allowed only from your IP  
  - HTTP → open for web access  

---

### **3. S3 Module**
Creates:
- S3 bucket  
- Block public access  
- Versioning  

---

### **4. DynamoDB Module**
Creates:
- DynamoDB table (key-value)  
- Provisioned or PAYG mode  

---

## Security Best Practices

- Store remote backend state in S3 + DynamoDB for safety  
- Different SSH keys recommended for **stage** and **prod**  
- Restrict SSH access using your IP (`/32`)  
- Never commit:
  - `terraform.tfstate`
  - `.terraform/` directory
  - Private SSH keys  

---

## Author

**Cheedella Jinesh**  
AWS & DevOps Engineer  

