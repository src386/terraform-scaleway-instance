variable "image_id" {}
variable "nb_instances" {
    type = number
}
variable "enable_public_ip" {}
variable "name" {}
variable "type" {}
variable "security_group_id" {
    default = null
}
variable "additional_volume_ids" {
    type    = list(string)
    default = null
}
variable "tags" {
    default = null
    type    = list(string)
}
variable "cloud_init" {
    default = null
}