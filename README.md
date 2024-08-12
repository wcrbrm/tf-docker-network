# TF docker network

Terraform plan to create local docker network, and encapsulate main project properties.

## Additional Scripts

This module will generate additonal scripts to manage your project

- Installing local cron
- Browsing Changelog files from docker containers of the project
- Browsing OpenAPI files from docker containers of the project

## Example

```hcl
module "example" {
    source = "github.com/webcerebrium/tf-docker-network"

    project = "example"
    env = "local"
    postfix = "00000000"
    workspace = "example-local"
}
```
