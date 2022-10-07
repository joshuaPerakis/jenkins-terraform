provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "teraform_testing123" {
   bucket = "teraform_testing123"
}
