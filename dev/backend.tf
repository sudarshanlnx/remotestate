terraform {
  backend "s3" {
    bucket         = "tera-state-2021"
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "lock-tera-2021"

  }
}