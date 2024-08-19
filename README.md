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

## Variables

| Name  | Type | Description |
| ------------- | ------------- | ------------- |
| env  | `string`  | environment name, example: `local`, `dev`, `prod` |
| labels  |  `list({ label, value })` | additional docker container labels that are specific for this project |
| log_opts  | `{ max-file, max-size }` | docker logs options |
| postfix  | `string` | unique suffix for docker containers of the environment |
| project  | `string` | project name, example: `myproject` |
| workspace  | `string` | workspace name, recommended example: `myproject-local`, `myproject-prod` |
