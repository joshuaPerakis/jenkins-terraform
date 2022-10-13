provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform-testing123-321" {
   bucket = "terraform-testing123-321"
}

# output "bucket-name" {
#   value =  resource.aws_s3_bucket.terraform-testing123-321
# }
