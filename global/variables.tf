variable "bucket_name" {
  description = "Name of the S3 bucket for Terraform remote state"
  type        = string
}

variable "dynamodb_table" {
  description = "Name of DynamoDB table for Terraform state locking"
  type        = string
}

variable "region" {
  description = "AWS region for backend resources"
  type        = string
  default     = "us-east-1"
}

