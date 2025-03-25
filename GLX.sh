#!/bin/bash

sudo rm "/etc/xray/yeda.json"

sudo bash -c 'cat > /etc/xray/yeda.json <<"EOF"
{
  "log": {
    "loglevel": "error"
  },
  "inbounds": [
    {
      "listen": "127.0.0.1",
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "udp": true
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "vless",
      "settings": {
        "vnext": [
          {
            "address": "185.70.187.210",
            "port": 443,
            "users": [
              {
                "id": "9284305e-9231-4904-8a94-389b00b47040",
                "encryption": "none",
                "flow": "xtls-rprx-vision"
              }
            ]
          }
        ]
      },
      "streamSettings": {
        "network": "tcp",
        "security": "reality",
        "realitySettings": {
          "show": false,
          "fingerprint": "chrome",
          "serverName": "www.cloudflare.com",
          "publicKey": "z9j8y8jTe0Xrrh64d4eXaPuGuP92gCVK9Gel0uazmWY",
          "shortId": "",
          "spiderX": ""
        }
      }
    }
  ]
}
EOF'

sudo nixos-rebuild switch --flake /home/lena/dotfiles --impure
