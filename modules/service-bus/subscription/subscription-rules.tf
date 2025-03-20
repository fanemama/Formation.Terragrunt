locals {
  subscription_rules_configs = var.subscription_rule_file_content
  subscription_rules         = merge([for key,value in local.flattened_subscriptions : {"${key}": value } if !(value.rules == null || length(value.rules) == 0) ]...)
  flattened_subscriptions_rules = merge(flatten([
    for sub_name, configs in local.flattened_subscriptions : [
      for rule_name in configs.rules : { "${sub_name}.${rule_name}" : {
        sub_name    = sub_name
        rule_config = lookup(local.subscription_rules_configs, rule_name, null)
        }
      } if can(local.subscription_rules_configs[rule_name]) 
    ]
  ])...)
}

resource "azurerm_servicebus_subscription_rule" "subscription_rules" {
  for_each        = local.flattened_subscriptions_rules
  name            = each.key
  subscription_id = resource.azurerm_servicebus_subscription.subscriptions[each.value.sub_name].id
  filter_type     =  each.value.rule_config.filter_type == "CorrelationFilter" ? "CorrelationFilter" : "SqlFilter" 

  dynamic "correlation_filter" {
    for_each = each.value.rule_config.filter_type == "CorrelationFilter" ? [each.value.rule_config.correlation_filter] : []
    content {
      properties = each.value.rule_config.correlation_filter
    }
  }
 sql_filter      = lookup(each.value.rule_config, "sql_filter", null)

}
