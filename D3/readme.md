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

<hr>

## for_each
```
variable "storage_name_foreach" {
  type = set(string)
  description = "value"
  default = [ "gaustorageacc11", "gaustorageacc12", "gaustorageacc13", "gaustorageacc14", "gaustorageacc15"]
}
```
```
resource "azurerm_storage_account" "example" {
  for_each                    = var.storage_name_foreach
  name                     = each.value
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = var.environment
  }
}
```
this creates the storage account with the name defined in the set of variables 
for_each only accepts the set or string type 
<hr>
## Lifectcle Rules
- Create before destroy --> we need to provide a conditioin that we need to have the resources before the existing resources is deleted.
- prevent destroy -->  the restriction not to change the resources
- ignore changes --> makes sure that no changes are made until in the code
- replace triggered by
- custom condition

