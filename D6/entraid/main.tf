data "azuread_domains" "aad" {
    only_initial = true
}
locals {
    domain = data.azuread_domains.aad.domains.*.domain_name
    users = csvdecode(file("users.csv"))

}
resource "azuread_user" "users" {
    for_each = { for user in local.users : "${user.first_name}.${user.last_name}" => user }
    user_principal_name = "${each.value.first_name}.${each.value.last_name}@${local.domain[0]}"
    display_name        = "${each.value.first_name} ${each.value.last_name}"
    mail_nickname       = "${each.value.first_name}.${each.value.last_name}"
    department          = each.value.department
    job_title           = each.value.job_title
    account_enabled     = true
}



output "users" {
    value = [for user in local.users : "${user.first_name}.${user.last_name}@${local.domain[0]}"]
}
output "domain" {
    value = local.domain
}