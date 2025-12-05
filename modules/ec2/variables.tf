variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "instance_count" {
  type    = number
  default = 1
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type    = string
  default = ""
}

variable "instance_name" {
  type    = string
  default = "web"
}

variable "sg_name" {
  type    = string
  default = "web-sg"
}

variable "http_allow_cidrs" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "my_ip_cidr" {
  type    = string
  default = "" # set to e.g. "203.0.113.5/32" to allow SSH from only your IP
}

variable "tags" {
  type    = map(string)
  default = {}
}

