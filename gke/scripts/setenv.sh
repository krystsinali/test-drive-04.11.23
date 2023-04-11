#!/bin/bash

# Set current folder
DIR=$(pwd)

### Set color
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`


#########################################################################################################
# Check if the configurations.tfvars file is created
if [ -f ../0.account_setup/configurations.tfvars ]
then 
  echo ${green} "Please continue" ${reset}
else 
  echo """
  
          ${red}Please create this file first ../0.account_setup/configurations.tfvars ${reset}
          
  """
  return
fi

#########################################################################################################
PROJECT_NAME=`cat ../0.account_setup/configurations.tfvars | grep PROJECT_NAME | awk '{print $3}' | tr -d '"'`
if  [ -z  $PROJECT_NAME ];
then 
  echo """
      ${red}Did you add project name in ../0.account_setup/configurations.tfvars  ${reset}
      
      PROJECT_NAME=YOUR_PROJECT_ID
      """
  return
else
  echo ${green} "Project ID is given" ${reset}
fi




#########################################################################################################
BUCKET_NAME=`cat ../0.account_setup/configurations.tfvars | grep BUCKET_NAME | awk '{print $3}' | tr -d '"'`
if  [ -z  $BUCKET_NAME ];
then 
  echo """
      ${red}Did you add bucket_name  in ../0.account_setup/configurations.tfvars  ${reset}
      
      BUCKET_NAME=YOUR_BUCKET_NAME
      """
  return
else
  echo ${green} "Bucket name is given" ${reset}
fi



#########################################################################################################
PACKAGE_NAME="tfenv"
if ! which $PACKAGE_NAME &> /dev/null;
then 
  echo """
      ${red}
      Please install tfenv before moving forward
        Instructions are here:
          git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
          echo 'export PATH="\$HOME/.tfenv/bin:\$PATH"' >> ~/.bash_profile
          source ~/.bash_profile 
          tfenv install TERRAFORM_VERSION  
          tfenv use TERRAFORM_VERSION
        ${reset}
  """
  return
else 
  echo ${green} "tfenv is installed please continue" ${reset}
fi

#########################################################################################################



gcloud config set project $PROJECT_NAME

#########################################################################################################
# Creates a service account
# SERVICE_ACCOUNT_NAME="project-sa-for-class"
# SA=`gcloud iam service-accounts list | grep $SERVICE_ACCOUNT_NAME | awk '{print $1}'`
# if [ -z $SA ];
# then 
#   echo "service account does not exist, creating one"
  # gcloud iam service-accounts create $SERVICE_ACCOUNT_NAME --description="This is used for $SERVICE_ACCOUNT_NAME" --display-name="$SERVICE_ACCOUNT_NAME"
  # gcloud iam service-accounts add-iam-policy-binding $SERVICE_ACCOUNT_NAME@$PROJECT_NAME.iam.gserviceaccount.com --member=serviceAccount:$SERVICE_ACCOUNT_NAME@$PROJECT_NAME.iam.gserviceaccount.com --role=roles/owner
  # mkdir -p ~/.google
  # gcloud iam service-accounts keys create ~/.google/service-account.json --iam-account=$SERVICE_ACCOUNT_NAME@$PROJECT_NAME.iam.gserviceaccount.com
  # gcloud auth activate-service-account  project-sa-for-class@terraform-project-farrukh90.iam.gserviceaccount.com  --key-file ~/.google/service-account.json 
# else  
  # echo "service account exists"
  # gcloud auth activate-service-account  project-sa-for-class@terraform-project-farrukh90.iam.gserviceaccount.com  --key-file ~/.google/service-account.json 
# fi
#########################################################################################################







cat << EOF > "$DIR/backend.tf"
terraform {
  backend "gcs" {
    bucket = "${BUCKET_NAME}"
    prefix = "/dev`pwd`"
  }
}
EOF
cat "$DIR/backend.tf"

export GOOGLE_PROJECT="$PROJECT_NAME"

echo """
      Your Project ID: ${green}$PROJECT_NAME${reset}
"""