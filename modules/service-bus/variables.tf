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

variable "topic_file_path" {
  description = "path of the topic file."
  type        = string
}

variable "subscription_file_path" {
  description = "path of the subscription file."
  type        = string
}

variable "subscription_rule_file_path" {
  description = "path of the subscription rule file."
  type        = string
}

variable "role_file_path" {
  description = "path of the topic file."
  type        = string
}

