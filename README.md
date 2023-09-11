
# Create a AWS ReadOnlyAccess



create a new user with ReadOnlyAccess Policy with configure an access and secrety key


## 1. ⚠️ Prerequisites

To be able to run the server installation script you have the following components installed on a linux server:

 - asible
 - aws-cli 
 - terraform
 - make
 - nano

> ❗️ Note: have configured aws cli with an account that has IAM management permissions



## 2.⚡️ Quick start

to create the user execute:
```bash
 make create 
```
> ❗️ Note: at the prompt enter the name of the user you want to create

## 3. 📝 Make command

to see all main commands
```bash
 make help 
```
command output:
```bash
help                           This help.
create                         Create on AWS a ReadOnly User
more                           Show extra avaiable Make command 
```

with the **make more** command you can see commands to carry out the step-by-step procedure or to remove the newly created user

```bash
 make more 
```
command output:
```bash
tf_init                        Terrafom init
tf_validate                    Terraform Validate
tf_destroy                     Terraform Destroy infrastructure
tf_apply                       Terraform Apply infrastructure changes
tf_output                      Terraform Show sensitive user data
```
### 3.1 Sequence of commands to execute to create a user:

```bash
 make tf_init 
 make tf_validate
 make tf_apply
```
use the tf_output command to view sensitive data on the screen
```bash
 make tf_output
```

command output:
```json
{
  "access_key_id" = [
    "<access key>",
  ]
  "access_key_secret:" = [
    "<secret>",
  ]
  "user_arn" = [
    "arn:aws:iam::<account id>:user/<user name>",
  ]
}
```


### 3.2 With the **tf_destroy** command you delete the created user and his access keys
```bash
 make tf_destroy
```
>❗️ Note: A valid terraform tfstate must be present


[repo_url]: https://scm.interlogica.it/utility/aws-readonly-user-access-key