terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 4.31.0"
   }
 }
}

provider "aws" {
  alias = "eu"
  region = var.aws_region
}

data "aws_iam_policy" "ReadOnlyAccess" {
  arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

data "aws_region" "current" {}


resource "aws_iam_user" "user" {
    name = var.account_name
}

resource "aws_iam_user_policy_attachment" "user_readonly" {
  user       = aws_iam_user.user.name
  policy_arn = data.aws_iam_policy.ReadOnlyAccess.arn
}


resource "aws_iam_access_key" "user-access_key" {
  user  =  aws_iam_user.user.name 
  depends_on = [aws_iam_user.user]
}
