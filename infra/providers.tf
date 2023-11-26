provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

terraform {
  backend "gcs" {
    bucket = "terraform-state-bucket-gcp-practice-project-aman"
    prefix = "cloud-workflows/excel-to-bigquery"
  }
}
