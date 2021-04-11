# ========================================================= #
#                                                           #
#                       Networking                          #
#                                                           #
# ========================================================= #

# Create a Public IP (if enable_public_ip = true)
resource "scaleway_instance_ip" "ip" {
  count        = var.nb_instances * (var.enable_public_ip == true ? 1 : 0)
}

# ========================================================= #
#                                                           #
#                       Instance                            #
#                                                           #
# ========================================================= #

resource "scaleway_instance_server" "instance" {

  count                 = var.nb_instances
  name                  = "${var.name}-${count.index}"
  type                  = var.type
  image = var.image_name
  security_group_id     = var.security_group_id
  additional_volume_ids = var.additional_volume_ids
  ip_id                 = scaleway_instance_ip.ip[count.index].id
  tags                  = var.tags
  cloud_init            = var.cloud_init
}