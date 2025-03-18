
module "service_bus" {
  source                         = "../../service-bus"
  topic_file_content             = data.local_file.topics.content
  subscription_file_content      = data.local_file.subscriptions.content
  subscription_rule_file_content = data.local_file.subscription_rules.content
  role_file_content              = data.local_file.roles.content
  environment = var.environment
}

