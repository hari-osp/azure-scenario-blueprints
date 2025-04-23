provider "azurerm" {
  features {}
}

resource "azurerm_sql_server" "example" {
  name                         = "sql-server-${var.project}"
  location                     = azurerm_resource_group.example.location
  resource_group_name          = azurerm_resource_group.example.name
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Password123!"
}

resource "azurerm_sql_failover_group" "example" {
  name                = "sql-failover-group-${var.project}"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_sql_server.example.name
  partner_server_id   = azurerm_sql_server.partner.name
  database_ids        = ["${azurerm_sql_database.example.id}"]
}
