terraform {
  backend "s3" {
    bucket = "equifax"
    key    = "dev/tfstate"
    region = "us-east-1"
  }
}