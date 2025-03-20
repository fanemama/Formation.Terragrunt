


locals {
  subscription_configs = var.subscription_file_content
  flattened_subscriptions = merge(flatten([
    for sub_name, configs in local.subscription_configs : [
      for config in configs : { "${sub_name}" : {
        topic_name         = config.topic
        requires_session   = lookup(config, "requires_session", false)
        lock_duration      = lookup(config, "lock_duration", "PT1M")
        max_delivery_count = lookup(config, "max_delivery_count", 10)
        rules              = lookup(config, "rules", [])
        }
      }
    ]
  ])...)
   topic_names = toset([for sub in local.flattened_subscriptions : sub.topic_name])
   
}

data "azurerm_servicebus_topic" "subscription_topics_data" {
  for_each     = local.topic_names 
  name         = "${var.topic_prefix}.${each.key}"
  namespace_id = var.namespace_id
}

resource "azurerm_servicebus_subscription" "subscriptions" {
  for_each           = local.flattened_subscriptions
  name               = "${var.subscription_prefix}.${each.key}"
  topic_id           = data.azurerm_servicebus_topic.subscription_topics_data[each.value.topic_name].id
  requires_session   = each.value.requires_session
  lock_duration      = each.value.lock_duration
  max_delivery_count = each.value.max_delivery_count
}


terraform {

}