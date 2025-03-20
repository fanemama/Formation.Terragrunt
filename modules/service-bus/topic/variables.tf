variable "topic_file_content" {
  description = "content of the topic file."
  type        = any
}

variable "topic_prefix" {
  description = "topic prefix."
  type        = any
}

variable "namespace_id" {
  description = "The Principal ID for the Service Principal associated with the Managed Service Identity of this ServiceBus Namespace."
  type        = string
}