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
      name = "bachelor-thesis-aws"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_budgets_budget" "basic-budget" {
  name         = "basic-monthly-budget"
  budget_type  = "COST"
  limit_amount = "1"
  limit_unit   = "USD"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["crutoi2001@gmail.com"]
  }
}