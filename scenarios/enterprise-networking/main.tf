resource "azurerm_resource_group" "rg" {
  name     = "rg-enterprise-networking"
  location = var.location
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet1-enterprise"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_virtual_network" "vnet2" {
  name                = "vnet2-enterprise"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_virtual_network_peering" "vnet_peering" {
  name                         = "peer-vnet1-vnet2"
  resource_group_name          = azurerm_resource_group.rg.name
  virtual_network_name         = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet2.id
  allow_virtual_network_access = true
}

resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-enterprise"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet1" {
  name                      = "subnet1"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet1.name
  address_prefix            = "10.0.1.0/24"
  network_security_group_id = azurerm_network_security_group.nsg.id
}

variable "location" {
  description = "Azure region"
  default     = "East US"
}
