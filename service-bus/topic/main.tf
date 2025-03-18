


locals {
  topic_configs = yamldecode(var.topic_file_content)
   topic_prefix = "sbt"
}


resource "azurerm_servicebus_topic" "topics" {
  for_each = local.topic_configs

  name         = "${var.topic_prefix}.${each.key}"
  namespace_id = var.namespace_id

  max_size_in_megabytes         = each.value != null ? lookup(each.value, "max_size_in_megabytes", 3072): 3072
}

terraform {

}