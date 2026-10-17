resource "azurerm_storage_account" "example" {
  # count                    = length(var.storage_name)
  for_each                    = var.storage_name_foreach
  # name                     = var.storage_name[count.index]
  name                     = each.value 
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = var.environment
  }
}