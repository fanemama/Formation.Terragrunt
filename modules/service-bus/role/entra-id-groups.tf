

locals {
  roles_configs    = var.role_file_content
  
  role_topic_names = toset(flatten([for key, value in local.roles_configs : flatten([value.data_sender, value.data_receiver])]))

  flattened_role_sender   = merge(flatten([for sp, roles in local.roles_configs : [for topic in roles.data_sender : { "${sp}" : topic }]])...)

  flattened_role_receiver = merge(flatten([for sp, roles in local.roles_configs : [for topic in roles.data_receiver : { "${sp}" : topic }]])...)
  
  service_principals = toset([for sp,roles in local.roles_configs : sp])
}

data "azuread_client_config" "current" {}

data "azuread_service_principal" "sp_asb_client" {
  for_each     = local.service_principals
  display_name = each.key
}

resource "azuread_administrative_unit" "service_bus" {
  display_name = "Service Bus"
}

resource "azuread_group" "asb_sender" {
  for_each                = local.role_topic_names
  display_name            = upper("${replace(each.key, ".", "-")}_sender")
  owners                  = [data.azuread_client_config.current.object_id]
  administrative_unit_ids = [resource.azuread_administrative_unit.service_bus.object_id]
  security_enabled        = true
}

resource "azuread_group_member" "member_asb_sender" {
  for_each                = local.flattened_role_sender 
  group_object_id  = resource.azuread_group.asb_sender[each.value].object_id
  member_object_id = data.azuread_service_principal.sp_asb_client[each.key].object_id
}

resource "azuread_group" "asb_receiver" {
  for_each                = local.role_topic_names
  display_name            = upper("${replace(each.key, ".", "-")}_receiver")
  owners                  = [data.azuread_client_config.current.object_id]
  administrative_unit_ids = [resource.azuread_administrative_unit.service_bus.object_id]
  security_enabled        = true
}

resource "azuread_group_member" "member_asb_receiver" {
  for_each                = local.flattened_role_receiver
  group_object_id  = resource.azuread_group.asb_receiver[each.value].object_id
  member_object_id = data.azuread_service_principal.sp_asb_client[each.key].object_id
}
