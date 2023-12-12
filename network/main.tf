resource "google_compute_subnetwork" "tf_public_subnet" {
  name          = var.public_subnet_name
  ip_cidr_range = var.public_subnet_cidr
  network       = var.vpc_id # Reference the VPC ID from variables
}
