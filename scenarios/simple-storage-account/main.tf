resource "azurerm_storage_account" "storage" {
  name                     = "storagacct12345"
  location                 = var.region
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "my-container"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}
