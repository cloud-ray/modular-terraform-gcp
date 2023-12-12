resource "google_service_account" "tf_service_account" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
}

resource "google_project_iam_member" "project" {
  project = "project-v-cloudray"
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.tf_service_account.email}"
}
