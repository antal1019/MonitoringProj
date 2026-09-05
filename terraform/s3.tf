terraform {
  backend "s3" {
    bucket = "project-bucket-1019"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
