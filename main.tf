  
terraform {
  backend "s3" {
    profile = "devops"
    bucket  = "xin-terraform-state-dev"
    key     = "terraform-artifactory/terraform.tfstate"
    region  = "ap-southeast-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    artifactory = {
      source  = "registry.terraform.io/jfrog/artifactory"
      version = "2.2.7"
    }
  }
}

provider "aws" {
  profile = "devops"
  region  = "ap-southeast-2"
}

provider "artifactory" {
  url      = "https://xinzhao.jfrog.io/"
  username = data.aws_ssm_parameter.artifactory_username.value
  password = data.aws_ssm_parameter.artifactory_password.value
}
