output "resource_group_name" {
  description = "The name of web store Azure resource group"
  value       = azurerm_resource_group.web_store.name
}

output "resource_group_id" {
  description = "The Id of web store Azure resource group"
  value       = azurerm_resource_group.web_store.id
}

output "resource_group_url" {
  description = "The URL of web store Azure resource group"
  value       = "https://portal.azure.com/#@/resource/subscriptions/${data.azurerm_client_config.client_config.subscription_id}/resourceGroups/${azurerm_resource_group.web_store.name}/overview"
}
