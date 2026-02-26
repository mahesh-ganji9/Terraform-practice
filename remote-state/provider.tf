terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0"
    }
  }

   backend "s3" {
     encrypt = true
     bucket = "devops-aws88s"
     key = "devops-aws88s.tfstate"
     use_lockfile = true
     region = "us-east-1"
   }

}
   provider "aws" {
     region = "us-east-1"
    }
