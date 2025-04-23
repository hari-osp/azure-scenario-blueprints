resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-cluster-identity"
  location            = var.region
  resource_group_name = var.resource_group_name
  dns_prefix          = "aks-cluster"
  identity {
    type                       = "UserAssigned"
    user_assigned_identity_ids = [var.managed_identity_id]
  }

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_DS2_v2"
  }
}
