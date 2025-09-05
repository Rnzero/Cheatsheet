

terraform {
  required_version = ">= 1.3.0"
  backend "s3" {
    bucket         = "myorg-terraform-states"
    key            = "eks/Non_Prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
