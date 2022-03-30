variable "tag_name" {}
variable "tag_category" {}


data "vsphere_tag_category" "tag_category" {
  name                            = var.tag_category
}


resource "vsphere_tag" "tag" {
  name                            = var.tag_name
  category_id                     = data.vsphere_tag_category.tag_category.id
  description                     = "Managed by Terraform"
}


output "vsphere_tag_id" {
  value                           = vsphere_tag.tag.id
}

