output "vpc_id" {
  description = "ID of the created VPC"
  value       = google_compute_network.tf_vpc.id
}
