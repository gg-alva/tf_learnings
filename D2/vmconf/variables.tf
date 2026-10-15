variable "environment" {
  type        = string
  description = "The env type"
  default     = "staging"
}
variable "is_delete" {
  type = bool
  description = "termination of machine"
  default = true
}
variable "storage_disk" {
  type = number
  description = "os disk storage"
  default = 30
}

variable "allowed_loc" {
  type        = list(string)
  description = "allowed location"
  default     = ["India South Central", "West Europe"]
}

variable "resource_tags" {
  type        = map(string)
  description = "The prefix for resource names"
  default     = {
    "environment" = "staging"
    "managed_by"  = "terraform"
    "department"  = "devops"
  }
}
variable "network_config" {
  type        = tuple([ string, string, number])
  description = "Network configuration"
  default     =  ["10.0.0.0/16", "10.0.2.0", 30]
}

variable "allowed_vm_size" {
  type        = list(string)
  description = "allowed vm size"
  default     = ["Standard_DS1_v2", "Standard_DS2_v2", "Standard_DS3_v2"]
  
}

variable "vm_config" {
  type        = object({
    size      = string
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  description = "Virtual Machine configuration"
  default = {
    size      = "Standard_DS1_v2"
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

}