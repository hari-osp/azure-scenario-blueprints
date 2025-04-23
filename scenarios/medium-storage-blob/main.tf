resource "azurerm_resource_group" "rg" {
  name     = "rg-medium-storage-blob"
  location = var.location
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "storageblobmedium"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "container"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}

variable "location" {
  description = "Azure region"
  default     = "East US"
}
