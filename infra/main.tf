# GCP Workflow
resource "google_workflows_workflow" "default" {
  name            = var.workflow_name
  region          = var.gcp_region
  description     = var.workflow_description
  service_account = var.service_account_email

  source_contents = templatefile("${path.module}/../src/gcs_to_bigquery.yaml", {})
}

# GCP Eventarc Trigger
resource "google_eventarc_trigger" "primary" {
  name            = var.trigger_name
  location        = "global"
  service_account = var.service_account_email

  matching_criteria {
    attribute = "type"
    value     = var.trigger_service_type
  }

  matching_criteria {
    attribute = "serviceName"
    value     = var.trigger_service_name
  }

  matching_criteria {
    attribute = "methodName"
    value     = var.trigger_method_name
  }

  matching_criteria {
    attribute = "resourceName"
    value     = var.workflow_trigger_bucket_path
    operator  = "match-path-pattern"
  }

  destination {
    workflow = google_workflows_workflow.default.id
  }
}
