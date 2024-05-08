variable log_opts {
  type = map
  description = "Docker logs options"
  default = {
      "max-file" = "3"
      "max-size" = "100m"
  }
}
