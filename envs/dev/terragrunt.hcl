include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../modules/service-bus"
}

inputs = {
  topic_file_path = "C:/Users/d-mdf/source/repos/Test/Formation.Terragrunt/envs/dev/config/topics.yml"
  subscription_file_path  = "C:/Users/d-mdf/source/repos/Test/Formation.Terragrunt/envs/dev/config/subscriptions.yml"
  subscription_rule_file_path = "C:/Users/d-mdf/source/repos/Test/Formation.Terragrunt/envs/dev/config/subscription-rules.yml"
  role_file_path  = "C:/Users/d-mdf/source/repos/Test/Formation.Terragrunt/envs/dev/config/roles.yml"
  environment ="dev"
}