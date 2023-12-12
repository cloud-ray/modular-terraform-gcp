resource "google_compute_network" "tf_vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = var.auto_create_subnetworks
}
