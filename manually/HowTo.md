# How to Create Read-Only Access on AWS Manually

From the main console screen, type in *IAM*. And select the suggested link.

![Alt text](img/step1.png?raw=true "IAM Service")

From the IAM dashboard select the Users section 1️⃣, and then Create user button 2️⃣.

![Alt text](img/step2.png?raw=true "User List")


Enter the new username for your read-only user (ReadOnlyAccessUser in this example), select "Provide user access to the AWS Management Console", if the user should also be able to log in to the console. Then select Next.

![Alt text](img/step3.png?raw=true "Create User")

on the next screen, select the **Attach policies directly** option, then use the search bar to search for **ReadOnlyAccess** policy. Select the check box beside that policy. 
Then select Next.

![Alt text](img/step4.png?raw=true "Create User")

on the next screen, select **Create User** button

![Alt text](img/step5.png?raw=true "Confirm Create User")