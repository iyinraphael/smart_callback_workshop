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

resource "genesyscloud_routing_queue" "callback_queue" {
  name                        = var.queue_name
  acw_wrapup_prompt          = "MANDATORY"
  wrapup_codes               = [genesyscloud_routing_wrapupcode.callback_wrapup.id]
}

resource "genesyscloud_routing_wrapupcode" "callback_wrapup" {
  name = "Callback Requested"
}

resource "genesyscloud_flow" "inbound_flow" {
  name        = var.flow_name
  type        = "inboundcall"
  filepath          = "${path.module}/../flows/smart_callback_flow.yaml"
  file_content_hash = filesha256("${path.module}/../flows/smart_callback_flow.yaml")

     substitutions = {
        queue_name = var.queue_name
     }
}