variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "azs" {
  description = "Optional AZ list to pin subnets to"
  type        = map(string)
  default     = {}
}

variable "name_prefix" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(string)
  default = {}
}

