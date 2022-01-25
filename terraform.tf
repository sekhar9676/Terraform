terraform {
  backend "s3" {
    bucket = "terraform-bucket9676"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}