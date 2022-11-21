resource "aws_s3_bucket" "terraform-testing123-321" {
      #checkov:skip=CKV_AWS_19:Exception for this bucket
   bucket = "terraform-testing123-321"
   tags   = {
      test = "test"
   }
}