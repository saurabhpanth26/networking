terraform {
  backend "s3" {
    bucket = "john.07-bucket"
    key    = "john.07-network-state"
    region = "ap-south-1"
  }
}



