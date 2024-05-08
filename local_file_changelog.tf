resource "local_file" "changelog" {
   content = <<EOF
#!/usr/bin/env bash

export YELLOW='\033[0;33m'
export NC='\033[0m'
export P=$${PROJECT:-${var.project}}
docker ps --filter label=project=$P --filter label=changelog.enable=true --format json | jq -r '[.Names, .Labels] | @tsv' | while read ROW; do
    # name is the first word in the string
    export NAME=$(echo $ROW | cut -d' ' -f1)
    echo -e $${YELLOW}## $NAME$${NC}
    # extract the word after changelog.file= before the comma
    export FN=$(echo $ROW | sed -n 's/.*changelog.file=\([^,]*\).*/\1/p')
    [[ "$FN" == "" ]] && continue	
    docker cp $NAME:$FN - | grep -a '^- '
    echo
done;

EOF
   filename = "./bin/changelog.sh"
   file_permission = "0777"
}

