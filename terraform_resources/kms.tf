resource "aws_kms_key" "a" {
    description             = "non rotated key"
    deletion_window_in_days = 7
    enable_key_rotation     = false
}

resource "aws_kms_key" "b" {
    description             = "non rotated key with exception"
    deletion_window_in_days = 7
    enable_key_rotation     = false
    #checkov:skip=CKV_AWS_7:Test skipping kms rotation for this specific key
}

resource "aws_kms_key" "c" {
    description             = "rotated key"
    deletion_window_in_days = 7
    enable_key_rotation     = true
}