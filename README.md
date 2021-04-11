# terraform-scaleway-instance

## Deploys 1+ scaleway instances, attach tags, security group.


This Terraform module deploys server instances with the following characteristics:

- Select the operating system via `image_name` and `image_architecture`
- (Optionnal) Creates and attach a Public IP via `enable_public_ip`
- (Optionnal) Cloud-init support via `cloud_init`
- (Optionnal) Attach to a Security Group via `security_group_id`
- (Optionnal) Add tags via `tags`

## Requirements

- `terraform` >= `0.12`

## Usage

```hcl
module "swarm-master" {
  source              = "git::ssh://git@github.com:src386/terraform-scaleway-instance.git"

  image_name          = "Debian Buster"
  image_architecture  = "x86_64"
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
|         image_name |      yes      |  string  |                "Debian Buster"               |
| image_architecture |      yes      |  string  |                   "x86_64"                   |
|       nb_instances |      yes      |  number  |                       1                      |
|   enable_public_ip |      yes      |   bool   |                     true                     |
|               name |      yes      |  string  |                  "webserver"                 |
|               type |      yes      |  string  |                   "DEV1-S"                   |
|  security_group_id |       no      |  string  |                                              |
|               tags |       no      |   list   |            ["docker","terraform"]            |
|         cloud_init |       no      |  string  | file("${path.module}/files/cloud-init.yaml") |