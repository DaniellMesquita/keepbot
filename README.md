```
--------------------------------------------

  _  __  ______   ______   _____  
 | |/ / |  ____| |  ____| |  __ \ 
 | ' /  | |__    | |__    | |__) |
 |  <   |  __|   |  __|   |  ___/ 
 | . \  | |____  | |____  | |     
 |_|\_\ |______| |______| |_|     
 
      | |             | |  
      | |__     ___   | |_ 
      | '_ \   / _ \  | __|
      | |_) | | (_) | | |_ 
      |_.__/   \___/   \__|  1.0
  
--------------------------------------------
```

# KEEP Bot

Absurdly easy script for setting up your KEEP Network and tBTC nodes.

Site: https://daniellmesquita.eth.link/keepbot (not done yet)

## Downloading and Installing

Current version: 1.0

For installing, execute the following 2 commands:

```sh
sudo apt-get install curl git
curl https://github.com/DaniellMesquita/keepbot/releases/download/1.0/keepbot.tar.gz --output keepbot.tar.gz && mkdir keepbot && mv keepbot.tar.gz keepbot && cd keepbot && tar -zxvf keepbot.tar.gz && sudo chmod +x install.sh && sudo sh ./install.sh
```

## Updating

Update KEEP Bot:

```sh
keepbot update
```

## Upgrading

Upgrade Docker and your KEEP Random Beacon node:

```sh
keepbot upgrade
```

## To do

* Resume steps after closing the term window
* Support both Ropsten testnet and mainnet
* Support tBTC ECDSA alongside KEEP Random Beacon
* Common modules (update)
* Useful commands and troubleshooting