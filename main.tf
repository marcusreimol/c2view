provider "google" {
  credentials = file("<YOUR_CREDENTIALS_FILE>.json")
  project     = "<YOUR_PROJECT_ID>"
  region      = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
