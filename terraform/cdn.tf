
resource "azurerm_cdn_profile" "cdn" {
  name                = "${var.webapp_name}-laws"
  location            = azurerm_resource_group.webapp-rg.location
  resource_group_name = azurerm_resource_group.webapp-rg.name
  sku                 = "Standard_Verizon"
}

resource "azurerm_cdn_endpoint" "cdn" { 
  name                = "${var.webapp_name}-endpoint"
  profile_name        = azurerm_cdn_profile.cdn.name
  location            =  azurerm_resource_group.webapp-rg.location
  resource_group_name = azurerm_resource_group.webapp-rg.name

  origin {
    name      = "webapp-wk"
    host_name = "www.dp-am55.com"
  }
}