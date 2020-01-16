provider "aws" {
   version = "~> 2.43"
    region  = "us-east-1"
   
    assume_role {
    role_arn     = "arn:aws:iam::546366803473:role/jenkins"
    session_name = "TERRAFORM"
    external_id  = "EXTERNAL_ID"
       }
  }
