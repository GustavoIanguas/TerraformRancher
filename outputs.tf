output "kube_config" {
  value = azurerm_kubernetes_cluster.k8s1.kube_config_raw

  sensitive = true
}