# checkov will only pick up default_tags when scanning the tfplan.json file
# checkov will not pick up default_tags when scanning .tf files
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