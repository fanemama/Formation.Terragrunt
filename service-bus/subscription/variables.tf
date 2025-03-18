variable "subscription_file_content" {
  description = "content of the subscription file."
  type        = any
}

variable "subscription_rule_file_content" {
  description = "content of the subscription rule file."
  type        = any
}

variable "topic_prefix" {
  description = "topic prefix."
  type        = any
}

variable "subscription_prefix" {
  description = "topic prefix."
  type        = any
}

variable "namespace_id" {
  description = "The Principal ID for the Service Principal associated with the Managed Service Identity of this ServiceBus Namespace."
  type        = string
}

