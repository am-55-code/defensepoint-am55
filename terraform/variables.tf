variable "heading" {
  description = "heading title for index.html"
  default     = "Hello World!"
  type        = string
  sensitive   = false

}

variable "region" {
  description = "Region for webapp"
  type        = string
  default     = "East US"

}

variable "webapp_name" {
  description = "Name for the webapp"
  type        = string
  default     = "webapp-wk"

}

variable "app_service_plan_sku" {
  description = "sku for service plan"
  type        = string
  default     = "F1"

}