output "params" {
  value = ({
    network_id = docker_network.internal.id,
    postfix    = var.postfix,
    project    = var.project,
    workspace  = var.workspace,
    env        = var.env
    log_opts   = var.log_opts
    labels = concat([{
      label = "project"
      value = var.project
    }], var.labels),
  })
}
