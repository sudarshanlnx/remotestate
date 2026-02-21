terraform {
  backend "s3" {
    bucket         = "jawabikes3"
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    # dynamodb_table = "tata-table"
    use_lockfile = true

  }
}
