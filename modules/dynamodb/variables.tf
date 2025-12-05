variable "table_name" {
  type        = string
  description = "DynamoDB table name"
  default = "terraform-lock"
}

variable "hash_key" {
  type    = string
  default = "LockID"
}

variable "hash_key_type" {
  type    = string
  default = "S"
}

variable "billing_mode" {
  type    = string
  default = "PAY_PER_REQUEST"
}

variable "ttl_attribute" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(string)
  default = {}
}

