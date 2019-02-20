/*
data "terraform_remote_state" "RemoteState_S3" {
  backend = "s3"

  config {
    bucket     = "${var.s3_rstate_bucket}"
    region     = "${var.aws_region}"
	    key 	   = "prod/terraform.tfstate"
    access_key = "${var.aws_accesskey}"
    secret_key = "${var.aws_secretkey}"
  }
}

data "terraform_remote_state" "vpc_state" {
  backend = "s3"

  config {
    bucket     = "${var.s3_rstate_bucket}"
    region     = "${var.aws_region}"
	    key 	   = "prod/terraform.tfstate"
    access_key = "${var.aws_accesskey}"
    secret_key = "${var.aws_secretkey}"
  }
}

*/