## This folder sets up your GCP account

<br>

### Instructions
1 Clone a repository 
```
cd && git clone https://github.com/Evolve-Cyber-Organization/project_infrastructure.git
```

2 Move to the folder

``` 
cd project_infrastructure/project_setup
```

3 Update Module configurations accordingly

4 Run terraform commands
```
source ../scripts/setenv.sh    # after creating the bucket
terraform init
terraform apply
```