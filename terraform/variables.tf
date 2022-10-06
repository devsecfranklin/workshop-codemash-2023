variable "region" {
  description = "The region will be used to choose the default location for regional resources. Regional resources are spread across several zones."
  type        = string
}

variable "zone" {
  description = "The zone will be used to choose the default location for zonal resources. Zonal resources exist in a single zone."
}

variable "project_id" {
  description = "The project indicates the default GCP project ID"
  type        = string
}

variable "location" {
  description = "https://cloud.google.com/storage/docs/locations"
  default     = "US"
  type        = string
}

variable "name" {
  description = "Name to add to our resources"
  type        = string
}

variable "service_account_email" {
  description = "https://tfsec.dev/docs/google/GCP012/"
  type        = string
}

variable "gh_secret_token" {
  description = "store github token in GCP secrets manager"
  type        = string
  default     = "gh_secret_token"
}

variable "cloud_function_repo" {
  description = "Directory to save the zip file to."
  type    = string
  default = "."
}

variable "function_name" {
  description = "The function name defined for Cloud Function handler."
  type        = string
}

variable "connector_id" {
  description = "The name of the VPC connector."
  type        = string
}
