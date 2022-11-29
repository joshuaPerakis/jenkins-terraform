provider "aws" {
    region = "us-east-1"
    default_tags {
        tags = var.tags
    }
}

terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
        }
    }
}

module "demo_test" {
    source = "./terraform_resources"
}