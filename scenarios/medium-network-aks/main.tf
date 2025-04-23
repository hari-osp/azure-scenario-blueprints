provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-${var.project}-${var.region}"
  location = var.region
}

resource "azurerm_virtual_network" "example" {
  name                = "vnet-${var.project}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "example" {
  name                 = "subnet-${var.project}"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "aks-${var.project}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "aks-${var.project}"
}
