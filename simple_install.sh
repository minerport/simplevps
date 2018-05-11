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

masternodeGenKey=""
while [[ $masternodeGenKey == "" ]];
do
	echo "Please enter the masternode private key:"
	read masternodeGenKey
	while true; do
		echo ""
		echo "Your private key is: $masternodeGenKey"
		read -p "Please confirm the private key is correct (y/n) " yn
		case $yn in
			[Yy]* ) break;;
			[Nn]* ) masternodeGenKey="" && echo ""; break;;
			* ) echo "Please answer yes or no.";;
		esac
	done
done

masternodeIP=`ifconfig | sed -s 's/addr:/ /g' | grep "inet" -m 1 | awk -F " " '{print $2}'`
while true; do
	echo ""
	echo "Your server IP is: $masternodeIP"
	read -p "Please confirm the IP is correct (y/n) " yn
	case $yn in
		[Yy]* ) break;;
		[Nn]* ) masternodeIP=""; break;;
		* ) echo "Please answer yes or no.";;
	esac
done

while [[ $masternodeIP == "" ]];
do
	echo ""
	echo "Please enter server IP:"
	read masternodeIP
	while true; do
		echo ""
		echo "Your server IP is: $masternodeIP"
		read -p "Please confirm the IP is correct (y/n) " yn
		case $yn in
			[Yy]* ) break;;
			[Nn]* ) masternodeIP="" && echo ""; break;;
			* ) echo "Please answer yes or no.";;
		esac
	done
done



echo ""
chmod +x install.sh
./install.sh -p simple -n 4
sed -i 's/HERE_GOES_YOUR_MASTERNODE_KEY_FOR_MASTERNODE_simple_1/'"$masternodeGenKey"'/g' /etc/masternodes/simple_n1.conf
sed -i 's/\[\#NEW_IPv4_ADDRESS_FOR_MASTERNODE_NUMBER\:\:\:1]/'"$masternodeIP"'/g' /etc/masternodes/simple_n1.conf
/usr/local/bin/activate_masternodes_simple
