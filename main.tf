# ========================================================= #
#                                                           #
#                       Networking                          #
#                                                           #
# ========================================================= #

# Create a Public IP (if enable_public_ip = true)
resource "scaleway_instance_ip" "ip" {
  count        = var.nb_instances * (var.enable_public_ip == true ? 1 : 0)
}

# Create and attach to a VPC (if private_network_id is defined)
resource "scaleway_instance_private_nic" "nic" {
  count                 = var.nb_instances * (var.private_network_id != "" ? 1 : 0)
  server_id             = scaleway_instance_server.instance[count.index].id
  private_network_id    = var.private_network_id
}

# ========================================================= #
#                                                           #
#                       Instance                            #
#                                                           #
# ========================================================= #

resource "scaleway_instance_server" "instance" {
  count                 = var.nb_instances

  # Mandatory
  image                 = var.image_id
  name                  = "${var.name}-${count.index}"
  type                  = var.type

  # Optionnal
  additional_volume_ids = var.additional_volume_ids
  cloud_init            = var.cloud_init
  enable_ipv6           = var.enable_ipv6
  ip_id                 = scaleway_instance_ip.ip[count.index].id
  placement_group_id    = var.placement_group_id
  security_group_id     = var.security_group_id
  tags                  = var.tags
  
}