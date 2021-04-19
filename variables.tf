# ========================================================= #
#                                                           #
#                  Mandatory variables                      #
#                                                           #
# ========================================================= #

variable "image_id" {
  description   = "Image ID. See README."
  type          = string
  default       = null
}

variable "name" {
  description   = "Name of the instance."
  type          = string
  default       = null
}

variable "type" {
  description   = "Instance SKU (DEV1-S, GP1-S...)"
  type          = string
  default       = null
}

# ========================================================= #
#                                                           #
#                  Optionnal variables                      #
#                                                           #
# ========================================================= #

variable "additional_volume_ids" {
  description   = "Data disks to attach."
  type          = list(string)
  default       = null
}

variable "cloud_init" {
  description   = "Cloud init to provision the instance with."
  type          = string
  default       = null
}

variable "enable_ipv6" {
  description   = "Enable IPv6 address."
  type          = bool
  default       = false
}

variable "enable_public_ip" {
  description   = "Provision and enable a Public IP."
  type          = bool
  default       = true
}

variable "nb_instances" {
  description   = "Number of instances."
  type          = number
  default       = 1
}

variable "placement_group_id" {
  description   = "Placement group ID."
  type          = string
  default       = null
}

variable "private_network_id" {
  description   = "VPC ID."
  type          = string
  default       = ""
}

variable "security_group_id" {
  description   = "Security group ID."
  type          = string
  default       = null
}

variable "tags" {
  description   = "A list of tags to add."
  type          = list(string)
  default       = null
}
