terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.46.0"
    }
  }
  # backend "s3" {
  #   bucket = "sca-s3-tf-remote-state-us-east-1-003"
  #   key    = "dev.tfstate"
  # }
}

provider "aws" {}