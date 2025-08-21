output "queue_id" {
  value = genesyscloud_routing_queue.callback_queue.id
}

output "flow_id" {
  value = genesyscloud_flow.inbound_flow.id
}
