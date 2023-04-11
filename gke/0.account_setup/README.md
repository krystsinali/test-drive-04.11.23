### Instructions

### Please navigate to 
https://console.cloud.google.com


#### Login with your brand new account
#### Search for "Create a Project" Tab
#### Create new project call it 
```
terraform-project-WHATEVER_YOU_WANT
```

#### Navigate to Cloud Storage, and create a bucket 
```
terraform-project-WHATEVER_YOU_WANT
```

#### Create a new file here called 
```
configurations.tfvars
```
#### and add the following message there 
```
google_domain_name = "AWS_DOMAIN"
email              = "EMAIL"

BUCKET_NAME        = "terraform-project-WHATEVER_YOU_WANT"
PROJECT_NAME       = "terraform-project-WHATEVER_YOU_WANT"
```


### Finally, run 
```
bash login.sh 
```
### And follow the instructions