# String type
variable "environment" {
  type        = string
  description = "Environment name (e.g., dev, prod, staging)"
  default     = "dev"
}


# List type
variable "account_names" {
  type        = list(string)
  description = "List of allowed Azure storage accounts"
  default     = ["gau11", "gau12", "gau13"]
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
    # "managed_by"  = "terraform"
    "department"  = "devops"
  }
}