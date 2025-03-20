include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../modules/service-bus"
}

inputs = {
  topic_file_path = "${get_terragrunt_dir()}/config/topics.yml"
  subscription_file_path  = "${get_terragrunt_dir()}/config/subscriptions.yml"
  subscription_rule_file_path = "${get_terragrunt_dir()}/config/subscription-rules.yml"
  role_file_path  = "${get_terragrunt_dir()}/config/roles.yml"
  environment ="dev"
}