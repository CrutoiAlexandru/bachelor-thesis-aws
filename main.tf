terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "CrutoiAlexandru"

    workspaces {
      name = "aws-server"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

module "ec2" {
  source = "./modules/ec2"
}

module "budget" {
  source = "./modules/budget"
}

module "iam" {
  source = "./modules/iam"
}

module "sg" {
  source = "./modules/sg"
}