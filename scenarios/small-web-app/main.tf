resource "azurerm_resource_group" "rg" {
  name     = "rg-small-web-app"
  location = var.location
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "asp-small-web-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "app_service" {
  name                = "app-small-web-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id
}

resource "azurerm_sql_server" "sql_server" {
  name                         = "sql-small-web-app"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd123"
}

resource "azurerm_sql_database" "sql_database" {
  name                = "db-small-web-app"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sql_server.name
}
