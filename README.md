# terraform-scaleway-instance

## Deploys 1+ scaleway instances, attach tags, security group.

This Terraform module deploys server instances with the following characteristics:

- Select the operating system via `image_id`
- (Optionnal) Creates and attach a Public IP via `enable_public_ip`
- (Optionnal) Cloud-init support via `cloud_init`
- (Optionnal) Attach to a Security Group via `security_group_id`
- (Optionnal) Add tags via `tags`
- (Optionnal) Attach to a VPC
- (Optionnal) Attach to a placement group

Find `image_id` for `x86_64` image of `Ubuntu Focal` in the `ams1` region:

```bash
curl https://api-marketplace.scaleway.com/images | jq '.images[] | select(.label=="ubuntu_focal") | .versions[].local_images[] | select(.zone=="ams1" and .arch=="x86_64")'
```

## Requirements

- `terraform` >= `0.13`

## Simple usage (mandatory variables only)

```hcl
module "instance" {
  source              = "github.com/src386/terraform-scaleway-instance.git""

  image_id            = "a3ea99d3-c2fe-4189-acd3-219d9057eadd" # Ubuntu Focal, ams1  
  name                = "webserver"
  type                = "DEV1-S"
}
```

## Advanced usage (all variables)

```hcl
module "instance" {
  source              = "github.com/src386/terraform-scaleway-instance.git""

  # Mandatory
  image_id              = "a3ea99d3-c2fe-4189-acd3-219d9057eadd" # Ubuntu Focal, ams1  
  name                  = "webserver"
  type                  = "DEV1-S"

  # Optionnal
  additional_volume_ids = ["fr-par-1/11111111-1111-1111-1111-111111111111"]
  cloud_init            = file("${path.module}/cloud-init.yaml")
  enable_ipv6           = true
  enable_public_ip      = true
  nb_instances          = 3
  placement_group_id    = "fr-par-1/11111111-1111-1111-1111-111111111111"
  private_network_id    = "fr-par-1/11111111-1111-1111-1111-111111111111"
  security_group_id     = "fr-par-1/11111111-1111-1111-1111-111111111111"
  tags                  = ["tag1","tag2","tag3"]
}
```

## Variables

|    **Variable**       | **Mandatory** | **Type**      | **Defaults** |
|----------------------:|:-------------:|:-------------:|:-------------|
|              image_id |      yes      |  string       |              |
|                  name |      yes      |  string       |              |
|                  type |      yes      |  string       |              | 
| additional_volume_ids |      no       |  list(string) |              |
|            cloud_init |      no       |  string       |              |
|           enable_ipv6 |      no       |  bool         | false        |
|      enable_public_ip |      no       |  bool         | true         |
|          nb_instances |      no       |  number       | 1            |
|    placement_group_id |      no       |  string       |              |
|    private_network_id |      no       |  string       |              |
|     security_group_id |      no       |  string       |              |
|                  tags |      no       |  list(string) |              |
