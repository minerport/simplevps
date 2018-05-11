#!/bin/bash

echo $(tput bold)$(tput setaf 2)
cat << "EOF"
 ███████╗██╗███╗   ███╗██████╗ ██╗     ███████╗   
 ██╔════╝██║████╗ ████║██╔══██╗██║     ██╔════╝   
 ███████╗██║██╔████╔██║██████╔╝██║     █████╗     
 ╚════██║██║██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝     
 ███████║██║██║ ╚═╝ ██║██║     ███████╗███████╗██╗
 ╚══════╝╚═╝╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝╚═╝
                       ╚╗ @marsmensch 2016-2018 ╔╝
EOF
echo "$(tput setaf 6)Donations (BTC): 33ENWZ9RCYBG7nv6ac8KxBUSuQX64Hx3x3 @marsmensch"
echo "Questions: contact@simplebank.io$(tput sgr0)"
echo ""

if [ "$EUID" -ne 0 ]
  then echo "Please run the script as root"
  exit
fi

echo ""
chmod +x install.sh
./install.sh -p simple -n 4 -u
/usr/local/bin/activate_masternodes_simple
