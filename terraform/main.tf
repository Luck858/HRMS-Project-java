terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "hrms" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "hrms" {
  name                = var.cluster_name
  location            = azurerm_resource_group.hrms.location
  resource_group_name = azurerm_resource_group.hrms.name
  dns_prefix          = var.cluster_name

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

  tags = {
    environment = var.environment
    project     = "hrms"
  }
}
