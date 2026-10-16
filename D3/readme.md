## Meta Arguments
- depends_on --> Resource A ---> depends_on Resource B {explicit dependencies}
- count  --> counts value
- for_each --> counters
- providers --> plugin
- lifecycle
    |
    v
  - create before destroy
  - prevent destroy
  - ignore changes
  - replace triggered by
  - custom conditions

## count 

```
variable "storage_name" {
  type = list(string)
  description = "value"
  default = [ "gaustorageacc11", "gaustorageacc12", "gaustorageacc13", "gaustorageacc14", "gaustorageacc15"]
}
```
```
resource "azurerm_storage_account" "example" {
  count                    = length(var.storage_name)
  name                     = var.storage_name[count.index]
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = var.environment
  }
}
```
this creates the required no of storage acc defined in the variables 
default = [ "gaustorageacc11", "gaustorageacc12", "gaustorageacc13", "gaustorageacc14", "gaustorageacc15"] = 5 accounts

count                    = length(var.storage_name) --> count=5

