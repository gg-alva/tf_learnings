locals {
  formatted_name =  lower(replace(var.project_name, " ", "-"))
  merge_tags = merge(var.default_tags,var.environment_tags)
#   storage_formatted = replace(replace(lower(substr(var.storage_account_name,0,23))," ",""),"!","")

}

resource azurerm_resource_group rg {
name = "${local.formatted_name}-rg"
location = "indiasouthcentral"

tags = local.merge_tags

}