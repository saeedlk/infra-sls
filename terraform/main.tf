provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket = "github-oidc-aws-tfstates-lk"
    key    = "infra2.tfstate"
    region = "ap-south-1"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [var.security_group_id]

  key_name = "mumbai-ssh"
  
  user_data = "${file("./Terraform/scripts/setup.sh")}"

  tags = {
    Name = "ws-tunnel-"
  }
}

output "instance_id" {
  value = aws_instance.ec2_instance.id
}