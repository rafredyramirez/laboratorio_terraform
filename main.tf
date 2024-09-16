terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "nginx-server" {
    count         = 2
    ami           = "ami-0440d3b780d96b29d"
    instance_type = "t3.micro"

    tags = {
        Name        = "nginx-server"
        Environment = "Dev"
        Owner       = "Fredy Ramírez"
        Team        = "DevOps"
        Project     = "E-commerce"
        Origin      = "Terraform"
    }
}