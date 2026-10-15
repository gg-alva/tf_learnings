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