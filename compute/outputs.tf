output "instance_id" {
  description = "ID of the created compute instance"
  value       = google_compute_instance.tf_instance.id
}
