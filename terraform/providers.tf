terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# CloudFront requires ACM certificates in us-east-1. A second provider
# alias is provided for that purpose if a custom domain is added later.
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}
