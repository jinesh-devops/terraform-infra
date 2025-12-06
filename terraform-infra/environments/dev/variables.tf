variable "aws_profile" {
  type    = string
  default = "default"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "name_prefix" {
  type    = string
  default = "tf"
}

variable "web_instance_count" {
  type    = number
  default = 1
}

variable "web_instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type    = string
  default = "" # Key Pair to ssh instance
}

variable "my_ip_cidr" {
  type    = string
  default = "" # set your public IP/CIDR e.g. "203.0.113.5/32" to restrict SSH
}

variable "http_allow_cidrs" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

