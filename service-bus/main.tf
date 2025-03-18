
module "topic" {
  source             = "./topic"
  topic_file_content = var.topic_file_content
  topic_prefix       = local.topic_prefix
  namespace_id       = resource.azurerm_servicebus_namespace.sbns_messagebus.id
  depends_on         = [resource.azurerm_servicebus_namespace.sbns_messagebus]
}


module "subscription" {
  source                         = "./subscription"
  subscription_file_content      = var.subscription_file_content
  subscription_rule_file_content = var.subscription_rule_file_content
  topic_prefix                   = local.topic_prefix
  subscription_prefix            = local.sub_prefix
  namespace_id                   = resource.azurerm_servicebus_namespace.sbns_messagebus.id
  depends_on                     = [module.topic]
}

module "role" {
  source            = "./role"
  role_file_content = var.role_file_content
  topic_prefix      = local.topic_prefix
  namespace_id      = resource.azurerm_servicebus_namespace.sbns_messagebus.id
  depends_on        = [module.topic]
}

terraform {

}