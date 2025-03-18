resource "azurerm_resource_group" "rg_messagebus" {
  name     = upper("rg-${local.resource_name_sufix}")
  location = var.location
  tags     = local.common_tags
}