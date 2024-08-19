variable labels {
    type = list(object({ 
        label = string, 
        value = string,
    }))
    default = []
    description = "additional docker container labels that are specific for this project"
}
