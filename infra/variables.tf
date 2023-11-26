
variable "gcp_project_id" {
  type        = string
  description = "Google project ID"
  default     = "gcp-practice-project-aman"
}

variable "gcp_region" {
  type        = string
  description = "Google project region"
  default     = "us-central1"
}

variable "workflow_name" {
  description = "A user-defined name of the Workflow."
  type        = string
  default     = "test-workflow-terraform"
}

variable "workflow_description" {
  description = "User-provided description of a Workflow."
  type        = string
  default     = "test workflow"
}

variable "trigger_name" {
  description = "A user-defined name of the Trigger."
  type        = string
  default     = "test-workflow-trigger-terraform"
}

variable "trigger_description" {
  description = "User-provided description of a Trigger."
  type        = string
  default     = "test workflow trigger"
}

variable "trigger_service_type" {
  description = "The type of the service that trigger dispatches events to."
  type        = string
  default     = "google.cloud.audit.log.v1.written"
}

variable "trigger_service_name" {
  description = "The name of the service that trigger dispatches events to."
  type        = string
  default     = "storage.googleapis.com"
}

variable "trigger_method_name" {
  description = "The name of the method within the service that trigger dispatches events to."
  type        = string
  default     = "storage.objects.create"
}

variable "workflow_trigger_bucket_path" {
  type        = string
  description = "value of the bucket path for cloud function trigger"
  default     = "projects/_/buckets/data-bucket-gcp-practice-project-aman/objects/workflow-raw-excel/*.xlsx"
}

variable "service_account_email" {
  type        = string
  description = "Service account email"
}
