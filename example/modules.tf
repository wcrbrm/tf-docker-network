module "example" {
    source = "../"

    # from GIT
    # source = "github.com/webcerebrium/tf-docker-network"

    # with specific version
    # source = "git::https://github.com/webcerebrium/tf-docker-network?ref=1a7c1730fe2ce0aa883f0cdb2cbefb1bed2d61d1"

    project = "example"
    env = "local"
    postfix = "00000000"
    workspace = "example-local"
}
