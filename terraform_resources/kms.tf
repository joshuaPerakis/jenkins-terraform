resource "aws_kms_key" "a" {
    description             = "non rotated key"
    deletion_window_in_days = 7
    enable_key_rotation     = false
}

# this exception only works when checkov scans the .tf file
# this exception will not work when scanning the tfplan.json file
resource "aws_kms_key" "b" {
    description             = "non rotated key with exception"
    deletion_window_in_days = 7
    #checkov:skip=CKV_AWS_7
    enable_key_rotation     = false
}

resource "aws_kms_key" "c" {
    description             = "rotated key"
    deletion_window_in_days = 7
    enable_key_rotation     = true
}