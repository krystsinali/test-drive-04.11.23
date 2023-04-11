module "account_setup" {
  source = "./module"
  account_setup = {
    billing_account_name = "My Billing Account"
    project_name         = "brave-nucleus-383419"
    bucket_name          = "terraform-project-krystsinali"
  }
}