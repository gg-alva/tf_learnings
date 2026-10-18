variable "project_name" {
  type        = string
  description = "Project name"
  default     = "Project ALPHA Resource"
}

variable "default_tags" {
    type = map(string)
    default = {
    company    = "CloudOps"
    managed_by = "terraform"
    }
}

variable "environment_tags" {
    type = map(string)
    default = {
    environment  = "production"
    cost_center = "cc-123"
    }
}
