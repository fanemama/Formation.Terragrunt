
data "azurerm_servicebus_topic" "role_topic_data" {
  for_each     = local.role_topic_names
  name         = "${var.topic_prefix}.${each.key}"
  namespace_id = var.namespace_id
}

resource "azurerm_role_assignment" "role_assign_asb_sender" {
  for_each             = local.role_topic_names
  scope                = data.azurerm_servicebus_topic.role_topic_data[each.key].id
  role_definition_name = "Azure Service Bus Data Sender"
  principal_id         = resource.azuread_group.asb_sender[each.key].object_id
}


resource "azurerm_role_assignment" "role_assign_asb_receiver" {
  for_each             = local.role_topic_names
  scope                = data.azurerm_servicebus_topic.role_topic_data[each.key].id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = resource.azuread_group.asb_receiver[each.key].object_id
}
terraform {

}