resource "azurerm_resource_group" "example" {
  lifecycle {
    create_before_destroy = true
    # ignore_changes = [
    #   tags,
    # ] this will ignore changes in tags and will not replace the resource group if tags are changed
    # replace_triggered_by = [
    #   azurerm_storage_account.example.id
    # ] #whenever storage account is changed, resource group will be replaced
    # prevent_destroy = true #this will prevent the resource group from being destroyed
    precondition {
      condition = contains(var.allowed_loc, var.location)
      error_message = "The location ${var.location} is not allowed."
    }
  }

  name     = "example-resources"
  location = var.location
  tags     = var.resource_tags
}