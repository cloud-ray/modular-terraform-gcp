output "public_subnet_id" {
  description = "ID of the created public subnet"
  value       = google_compute_subnetwork.tf_public_subnet.id
}
