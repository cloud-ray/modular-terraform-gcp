# Create SSH Keys
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "public_key" {
  content  = tls_private_key.example.public_key_openssh
  filename = "${path.module}/id_rsa.pub"
}

resource "local_file" "private_key" {
  content  = tls_private_key.example.private_key_pem
  filename = "${path.module}/id_rsa"
}

resource "google_compute_instance" "tf_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.tags

  boot_disk {
    initialize_params {
      image = var.image_type
    }
  }

  network_interface {
    subnetwork = var.subnet_id # Reference the subnet ID from variables

    access_config {
      # Ephemeral IP
    }
  }

  metadata = {
    ssh-keys = "tfuser:${tls_private_key.example.public_key_openssh}"
  }

  service_account {
    email  = var.service_account_email # Reference the service account email from variables
    scopes = ["userinfo-email", "compute-rw", "storage-rw"]
  }
}
