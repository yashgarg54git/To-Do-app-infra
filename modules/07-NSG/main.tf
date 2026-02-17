resource "azurerm_network_security_group" "nsg" {
  for_each = var.nsgs

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_network_security_rule" "ssh" {
  for_each = var.nsgs

  name                        = "allow-ssh"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"

  resource_group_name         = each.value.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg[each.key].name
}

resource "azurerm_network_security_rule" "http" {
  for_each = var.nsgs

  name                        = "allow-http"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"

  resource_group_name         = each.value.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg[each.key].name
}

