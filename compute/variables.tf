variable "instance_name" {
  description = "Name of the compute instance"
  type        = string
  default     = "tf-instance"
}

variable "machine_type" {
  description = "Machine type for the compute instance"
  type        = string
  default     = "f1-micro"
}

variable "image_type" {
  description = "Boot image for the compute instance"
  type        = string
  default     = "debian-11-bullseye-v20231115"
}

variable "zone" {
  description = "Zone for the compute instance"
  type        = string
  default     = "us-east1-c"
}

variable "tags" {
  description = "Tags for the compute instance"
  type        = list(string)
  default     = ["terraform-firewall"]
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
  # No default value here; it will be set in the root configuration
}

variable "service_account_email" {
  description = "Email of the service account"
  type        = string
  # No default value here; it will be set in the root configuration
}
