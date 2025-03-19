
module "topic" {
  source             = "./topic"
  topic_file_content = data.local_file.topics.content
  topic_prefix       = local.topic_prefix
  namespace_id       = resource.azurerm_servicebus_namespace.sbns_messagebus.id
  depends_on         = [resource.azurerm_servicebus_namespace.sbns_messagebus]
}


module "subscription" {
  source                         = "./subscription"
  subscription_file_content      = data.local_file.subscriptions.content
  subscription_rule_file_content = data.local_file.subscription_rules.content
  topic_prefix                   = local.topic_prefix
  subscription_prefix            = local.sub_prefix
  namespace_id                   = resource.azurerm_servicebus_namespace.sbns_messagebus.id
  depends_on                     = [module.topic]
}

module "role" {
  source            = "./role"
  role_file_content = data.local_file.roles.content
  topic_prefix      = local.topic_prefix
  namespace_id      = resource.azurerm_servicebus_namespace.sbns_messagebus.id
  depends_on        = [module.topic]
}

