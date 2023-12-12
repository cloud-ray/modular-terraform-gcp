variable "public_subnet_name" {
  description = "Name of the public subnet"
  type        = string
  default     = "tf-public-subnet"
}

variable "public_subnet_cidr" {
  description = "CIDR range for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# Add the variable for VPC ID
variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
  # No default value here; it will be set in the root configuration
}
