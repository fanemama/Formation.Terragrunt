resource "azurerm_servicebus_namespace" "sbns_messagebus" {
  name                = "sbns-${local.resource_name_sufix}"
  resource_group_name = resource.azurerm_resource_group.rg_messagebus.name
  location            = resource.azurerm_resource_group.rg_messagebus.location
  sku                 = "Standard"
  tags                = local.common_tags
}