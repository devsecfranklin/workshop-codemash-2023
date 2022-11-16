terraform {
  required_version = ">= 1.0.3"

  required_providers {
    null     = "~> 3.2.0"
    random   = "~> 3.4.0"
    external = "~> 2.2.0"
    google = {
      source = "hashicorp/google"
    }
  }
  #backend "gcs" {
  #  bucket = "franklin-devsecops"
  #  prefix = "codemash-cloudbot"
  //credentials = "$GOOGLE_APPLICATION_CREDENTIALS"
  #}
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone // provider level zone option, but needed in this case for oauth
  //impersonate_service_account = var.service_account_terraform
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}
