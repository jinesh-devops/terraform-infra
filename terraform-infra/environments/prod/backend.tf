terraform {
  backend "s3" {
    bucket = "terraform-remote-state-jinesh"
    region = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    key = "prod/terraform.tfstate"
  }
}
