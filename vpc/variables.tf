variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "tf-vpc"
}

variable "auto_create_subnetworks" {
  description = "Auto-create subnetworks for the VPC"
  type        = bool
  default     = false
}
