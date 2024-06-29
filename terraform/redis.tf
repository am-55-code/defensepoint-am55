resource "azurerm_redis_cache" "redis" {
  name                = "${var.webapp_name}-redis"
  location            = azurerm_resource_group.webapp-rg.location
  resource_group_name = azurerm_resource_group.webapp-rg.name
  capacity            = 1
  family              = "P"
  sku_name            = "Premium"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"


  redis_configuration {}
}