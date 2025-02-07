terraform {
  backend "s3" {
    bucket         = "video-analysis-terraform-state-sean"
    key            = "vpc/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "video-analysis-terraform-locks"
    encrypt        = true
  }
}