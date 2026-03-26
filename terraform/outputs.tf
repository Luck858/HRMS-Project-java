output "kube_config" {
  value     = azurerm_kubernetes_cluster.hrms.kube_config_raw
  sensitive = true
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.hrms.name
}

output "resource_group_name" {
  value = azurerm_resource_group.hrms.name
}
