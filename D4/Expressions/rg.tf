resource "azurerm_resource_group" "rg" {


  name     = "example-resources"
  location = var.allowed_loc[0]
  tags     = var.resource_tags
}