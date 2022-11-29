resource "aws_kms_key" "a" {
    description             = "non rotated key"
    deletion_window_in_days = 7
    enable_key_rotation     = false
}

resource "aws_kms_key" "b" {
    description             = "rotated key"
    deletion_window_in_days = 7
    enable_key_rotation     = true
}