data "local_file" "topics" {
  filename = var.topic_file_path
}

data "local_file" "subscriptions" {
  filename = var.subscription_file_path
}

data "local_file" "subscription_rules" {
  filename = var.subscription_rule_file_path
}

data "local_file" "roles" {
  filename = var.role_file_path
}