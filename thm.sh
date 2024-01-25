#!/bin/bash
#vpn connection

if [ -z "$1" ]; then
  echo "Please enter your thm file name "
exit 
fi


function vpn(){

curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ buster main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
sudo apt update && sudo apt install cloudflare-warp
warp-svc register&
warp-cli register
warp-cli connect
sudo openvpn $1.ovpn&
ping 10.10.10.10 -c 3
warp-cli disconnect


}
vpn


