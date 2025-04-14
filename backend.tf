# terraform {
#  backend "s3" {
#    bucket = "${var.backend-aws-s3-name}"
#    key    = "${var.backend-s3-bucket-key}"
#    region = "${var.backend-aws-region}"
#    dynamodb_table = "${var.backend-dynamodb-table}"
#    encrypt = true
#  }
#}

# it said variables are not supported for backend so I just changed it to what it was
terraform {
  backend "s3" {
    bucket = "terraform-state-lras"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock-lras"
    encrypt = true
  }
}