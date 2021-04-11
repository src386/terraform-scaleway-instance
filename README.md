# terraform-scaleway-instance

## Deploys 1+ scaleway instances, attach tags, security group.


This Terraform module deploys server instances with the following characteristics:

- Select the operating system via `image_id`
- (Optionnal) Creates and attach a Public IP via `enable_public_ip`
- (Optionnal) Cloud-init support via `cloud_init`
- (Optionnal) Attach to a Security Group via `security_group_id`
- (Optionnal) Add tags via `tags`

Find `image_id` for `x86_64` image of `Ubuntu Xenial` in the `ams1` region:

```bash
curl https://api-marketplace.scaleway.com/images | jq '.images[] | select(.label=="ubuntu_xenial") | .versions[].local_images[] | select(.zone=="ams1" and .arch=="x86_64")'
```

## Requirements

- `terraform` >= `0.12`

## Usage

```hcl
module "swarm-master" {
  source              = "github.com/src386/terraform-scaleway-instance.git""

  image_id            = "7d04dd2a-6cee-4aec-be9e-f87154009112" # Ubuntu Xenial, ams1
  nb_instances        = 1
  enable_public_ip    = true
  name                = "webserver"
  type                = "DEV1-S"
  security_group_id   = scaleway_instance_security_group.securitygroup.id
  tags                = ["docker","terraform"]
  cloud_init          = file("${path.module}/files/master/cloud-init.yaml")
}
```

## Variables

|    **Variable**    | **Mandatory** | **Type** |                  **Example**                 |
|-------------------:|:-------------:|:--------:|:---------------------------------------------|
|           image_id |      yes      |  string  |   "7d04dd2a-6cee-4aec-be9e-f87154009112      |
|       nb_instances |      yes      |  number  |                       1                      |
|   enable_public_ip |      yes      |   bool   |                     true                     |
|               name |      yes      |  string  |                  "webserver"                 |
|               type |      yes      |  string  |                   "DEV1-S"                   |
|  security_group_id |       no      |  string  |                                              |
|               tags |       no      |   list   |            ["docker","terraform"]            |
|         cloud_init |       no      |  string  | file("${path.module}/files/cloud-init.yaml") |