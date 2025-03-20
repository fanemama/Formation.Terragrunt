locals {
  common_tags = {
    environment     = var.environment,
    applicationName = var.application_name,
  }
  resource_name_sufix = "${var.application_name}-${lookup(var.prefix_location, var.location, var.location)}-${var.environment}-${var.instance}"
  topic_prefix = "sbt"
  sub_prefix = "sbts"
}

resource "azurerm_resource_group" "rg_messagebus" {
  name     = upper("rg-${local.resource_name_sufix}")
  location = var.location
  tags     = local.common_tags
}