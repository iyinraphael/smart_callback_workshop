terraform {
    required_providers{
        genesyscloud = { source = "MyPureCloud/genesyscloud", version = ">= 1.61.0" }
    }
}

provider "genesyscloud" {
  oauthclient_id     = var.genesys_cloud_client_id
  oauthclient_secret = var.genesys_cloud_client_secret
  aws_region         = var.genesyscloud_region
}


resource "genesyscloud_flow" "inbound_flow" {
  name              = var.flow_name
  type              = "inboundcall"
  filepath          = "${path.module}/../flows/workshop_smart_callback_flow_v2-0.yaml"
  file_content_hash = filesha256("${path.module}/../flows/workshop_smart_callback_flow_v2-0.yaml")

  substitutions = {
    data_action_category = var.data_action_category
    queue_id             = var.queue_id
    flow_name            = var.flow_name
    queue_name           = var.queue_name
  }
}