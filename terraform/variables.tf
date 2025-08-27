variable "queue_name" {
  default = "iyin_servicenow"
}

variable "queue_id" {
  description = "Queue id"
}

variable "flow_name" {
  default = "Workshop Smart Callback Flow"
}

variable "data_action_category" {
    description = "Data category integration for data action"
}

variable "genesyscloud_region" {
  description = "AWS region where your Genesys Cloud org lives (e.g. us-east-1)"
  default     = "us-east-1"
}

variable "genesys_cloud_client_id" {
  type        = string
  description = "Genesys Cloud OAuth Client ID"
}

variable "genesys_cloud_client_secret" {
  type        = string
  description = "Genesys Cloud OAuth Client Secret"
  sensitive   = true
}
