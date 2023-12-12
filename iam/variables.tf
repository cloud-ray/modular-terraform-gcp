variable "service_account_id" {
  description = "ID of the service account"
  type        = string
  default     = "tf-service-account"
}

variable "service_account_display_name" {
  description = "Display name of the service account"
  type        = string
  default     = "Custom TF SA for VM Instance"
}
