variable "location" {
  description = "Azure region to deploy resources"
  default     = "westeurope"
}

variable "prefix_location" {
  description = "Prefix for the location"
  default = {
    westeurope       = "weu"
    switzerlandnorth = "nch"
  }
}

variable "application_name" {
  description = "The name of the project"
  default     = "messagebus"
}

variable "environment" {
  description = "Environment"
}
variable "instance" {
  description = "Instance"
  default     = "001"
}

variable "topic_file_content" {
  description = "content of the topic file."
  type        = any
}

variable "subscription_file_content" {
  description = "content of the subscription file."
  type        = any
}

variable "subscription_rule_file_content" {
  description = "content of the subscription rule file."
  type        = any
}

variable "role_file_content" {
  description = "content of the topic file."
  type        = any
}
