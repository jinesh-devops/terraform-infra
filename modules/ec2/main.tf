# Security group
resource "aws_security_group" "web_sg" {
  name        = var.sg_name
  description = "Allow HTTP and SSH (ssh from my IP)"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.http_allow_cidrs
  }

  # ssh access to my ip
  dynamic "ingress" {
    for_each = var.my_ip_cidr == "" ? [] : [1]
    content {
      description = "SSH from my IP"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [var.my_ip_cidr]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = var.instance_name != "" ? "${var.instance_name}-sg" : "web-sg" })
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] 
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = element(var.subnet_ids, count.index % length(var.subnet_ids))
  key_name      = var.key_name != "" ? var.key_name : null
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = merge(var.tags, {
    Name = var.instance_name != "" ? "${var.instance_name}-${count.index + 1}" : "web-${count.index + 1}"
  })

  associate_public_ip_address = true
}

