terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0"
    }
  }
  backend "s3" {
    encrypt      = true
    bucket       = "terraform-bucket-terrafom09"
    key          = "terraform.tfstate"
    use_lockfile = false
    region       = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"

}