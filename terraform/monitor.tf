resource "azurerm_log_analytics_workspace" "laws" {
  name                = "${var.webapp_name}-laws"
  location            = azurerm_resource_group.webapp-rg.location
  resource_group_name = azurerm_resource_group.webapp-rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

}

resource "azurerm_application_insights" "insights" {
  name                = "${var.webapp_name}-app-insights"
  location            = azurerm_resource_group.webapp-rg.location
  resource_group_name = azurerm_resource_group.webapp-rg.name
  workspace_id        = azurerm_log_analytics_workspace.laws.id
  application_type    = "web"

}