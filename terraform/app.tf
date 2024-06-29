locals {
  data_inputs = {
    heading_one = var.heading
  }
}
// RG Parameters
resource "azurerm_resource_group" "webapp-rg" {
  name     = "${var.webapp_name}-rg"
  location = var.region
}

// Service Plan
resource "azurerm_service_plan" "webapp" {
  name                = "${var.webapp_name}-sp"
  resource_group_name = azurerm_resource_group.webapp-rg.name
  location            = azurerm_resource_group.webapp-rg.location
  os_type             = "Linux"
  sku_name            = var.app_service_plan_sku
}

// Linux WebApp
resource "azurerm_linux_web_app" "webapp" {
  name                = "${var.webapp_name}-app"
  resource_group_name = azurerm_resource_group.webapp-rg.name
  location            = azurerm_service_plan.webapp.location
  service_plan_id     = azurerm_service_plan.webapp.id
  https_only = true

  app_settings = {
    AZURE_COSMOS_CONNECTION_STRING        = azurerm_cosmosdb_account.cosmosdb.connection_strings[0]
    AZURE_COSMOS_DATABASE                 = "catalogdb"
    AZURE_REDIS_CONNECTION_STRING         = azurerm_redis_cache.redis.primary_connection_string
    AZURE_REDIS_HOSTNAME                  = azurerm_redis_cache.redis.hostname
    AZURE_REDIS_PORT                      = azurerm_redis_cache.redis.ssl_port
    AZURE_MANAGED_IDENTITY_PRINCIPAL_ID   = ""
    PRODUCT_LIST_CACHE_DISABLE            = "0"
    SIMULATED_DB_LATENCY_IN_SECONDS       = "2"
    APPINSIGHTS_INSTRUMENTATIONKEY        = azurerm_application_insights.insights.instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING = azurerm_application_insights.insights.connection_string
  }

  site_config {
    always_on = false
    
    application_stack {
        dotnet_version = "7.0"      
    }
  }

    lifecycle {
    ignore_changes = [
      site_config["application_insights_connection_string"],
      site_config["application_insights_key"]
    ]
  }
}
  
