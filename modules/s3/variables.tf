variable "bucket_name" {
  type        = string
  description = "S3 bucket name (must be globally unique)"
}

variable "sse_algorithm" {
  type    = string
  default = "AES256"
}

variable "tags" {
  type    = map(string)
  default = {}
}

