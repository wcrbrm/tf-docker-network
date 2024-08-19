resource "local_file" "crontab" {
   content = <<EOF
#!/usr/bin/env bash

#
# This script ./bin/crontab.sh  is used to install or clean crontab files
# gathered from different terraform modules in ./cron.d/ folder of the workspace
#
# Must be executed with sudo
# Usage: sudo ./bin/crontab.sh clean init
#

if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

[[ "$1" == "clean" ]] && {
  ls -All /etc/cron.d/crontab_*  
  rm -rf /etc/cron.d/crontab_*
  echo "CRONTAB REMOVED"
  shift
}

[[ "$1" == "init" ]] && {
  for i in ./cron.d/crontab_*; do
    export fn=$(echo $i | cut -f3 -d/)
    if [ -f /etc/cron.d/$fn ]; then
       echo "$fn already installed"
    else 
       cp -f $i /etc/cron.d/$fn
       echo "$fn INSTALLED"
    fi
    chown root /etc/cron.d/$fn
    chmod 0600 /etc/cron.d/$fn
  done
  echo "CRONTAB INSTALLED"
}

EOF
   filename = "./bin/crontab.sh"
   file_permission = "0777"
}

