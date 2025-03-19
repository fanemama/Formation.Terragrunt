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
  type        = any
}

variable "subscription_file_path" {
  description = "path of the subscription file."
  type        = any
}

variable "subscription_rule_file_path" {
  description = "path of the subscription rule file."
  type        = any
}

variable "role_file_path" {
  description = "path of the topic file."
  type        = any
}
variable "ARM_CLIENT_SECRET" {
  description = "The client secret for the Azure Service Principal"
  type        = string
  sensitive   = true
}

variable "ARM_CLIENT_ID" {
  description = "The client ID for the Azure Service Principal"
  type        = string
  sensitive   = true
}

variable "ARM_TENANT_ID" {
  description = "The tenant ID for Azure AD"
  type        = string
  sensitive   = true
}

variable "ARM_SUBSCRIPTION_ID" {
  description = "The subscription ID for Azure"
  type        = string
}
