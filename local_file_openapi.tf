resource "local_file" "openapi" {
  content         = <<EOF
#!/usr/bin/env bash

#
# this script looks through every running docker container of the project
# to find if it has a command to retrieve OpenAPI JSON in its labels
#
# if so, it executes this command and prints the content of the OpenAPI JSON
# in a summary format
#
# Usage: ./bin/openapi.sh
#

export P=$${PROJECT:-${var.project}}
docker ps --filter label=project=$P --filter label=openapi.enable=true --format json | jq -r '[.Names, .Labels] | @tsv' | while read ROW; do
    # name is the first word in the string
    export NAME=$(echo $ROW | cut -d' ' -f1)
    echo "## $NAME"
    # extract the word after openapi.cmd= before the comma
    export FN=$(echo $ROW | sed -n 's/.*openapi.cmd=\([^,]*\).*/\1/p')
    [[ "$FN" == "" ]] && continue	
    docker exec -e RUST_LOG=none $NAME $FN
    echo
done;
EOF
  filename        = "./bin/openapi.sh"
  file_permission = "0777"
}

