## This folder sets up your cluster

<br>

### Instructions
1 Clone a repository 
```
cd && git clone https://github.com/Evolve-Cyber-Organization/project_infrastructure.git
```

2 Move to the folder

``` 
cd project_infrastructure/2.cluster_setup
```

3. Update Module configurations accordingly

4. Set up backend
```
source ../scripts/setenv.sh
```

## Configure tfenv if needed
```
tfenv install 1.1.1
tfenv use 1.1.1
```


5. Run terraform commands
```
terraform init
terraform apply
```