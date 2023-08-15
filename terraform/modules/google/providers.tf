terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.77.0"
    }

    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.77.0"
    }
  }
}

provider "google" {
  credentials = file("${var.KEYS_DIR}/${var.CREDENTIALS_FILE}")
  project     = var.PROJECT
  region      = var.REGION
  zone        = var.ZONE
}

provider "google-beta" {
  credentials = file("${var.KEYS_DIR}/${var.CREDENTIALS_FILE}")
  project     = var.PROJECT
  region      = var.REGION
  zone        = var.ZONE
}
