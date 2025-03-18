data "local_file" "topics" {
  filename = "./config/topics.yml"
}

data "local_file" "subscriptions" {
  filename = "./config/subscriptions.yml"
}

data "local_file" "subscription_rules" {
  filename = "./config/subscription-rules.yml"
}

data "local_file" "roles" {
  filename = "./config/roles.yml"
}