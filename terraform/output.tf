output "user" {
  sensitive = true 
  value = {
    "user_arn": aws_iam_user.user.*.arn
    "access_key_id":  aws_iam_access_key.user-access_key.*.id
    "access_key_secret:": aws_iam_access_key.user-access_key.*.secret  
  }  
  
}