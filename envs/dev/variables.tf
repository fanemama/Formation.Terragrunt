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

variable "environment" {
  description = "Environment"
  default     = "dev"
}