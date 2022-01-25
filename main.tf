terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }    
}

provider "aws" {
 version = "~> 3.0"
 region   = "ap-south-1"
}

resource "aws_security_group" "terraform_sg" {
  name        = "terraform"
  description = "Allow SSH inbound traffic" 

  
 ingress {
    description      = "SSH from outside"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "terraform_server" {
    ami = var.ami
    instance_type = var.instance_type
    associate_public_ip_address = true
    key_name = "terraform_key"
    vpc_security_group_ids = ["sg-06e0534059f33661c"]

    tags = {
        "name":"terraform"
    }
}

resource "aws_s3_bucket" "terraform_bucket" {
  bucket = "terraform-bucket9676"
  acl    = "private"
  versioning {
    enabled = true
  }
}







