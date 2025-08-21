variable "queue_name" {
  default = "Workshop-Callback-Queue"
}

variable "flow_name" {
  default = "Workshop Smart Callback Flow"
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
