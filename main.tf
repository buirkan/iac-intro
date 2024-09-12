terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-05134c8ef96964280"
  instance_type = "t2.micro"
  key_name      = "iac"
  # user_data     = <<-EOF
  #   #!/bin/bash
  #   cd /home/ubuntu
  #   echo "Testing" > index.html
  #   nohup busybox httpd -f -p 8080 &
  #   EOF
  tags = {
    Name = "Terraform Ansible Python"
  }
}
