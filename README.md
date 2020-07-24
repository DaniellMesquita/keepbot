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
      |_.__/   \___/   \__|  1.2.4
  
--------------------------------------------
```

# KEEP Bot

Absurdly easy script for setting up your KEEP Network and tBTC nodes.

Site: https://daniellmesquita.eth.link/keepbot (not done yet)

## Downloading and Installing

Current version: 1.2.4

For installing, execute the following 2 commands:

```sh
sudo apt-get install wget git
```

```sh
cd && wget https://github.com/DaniellMesquita/keepbot/releases/download/1.2.4/keepbot.tar.gz -O keepbot.tar.gz && mkdir -p keepbot && mv -f keepbot.tar.gz keepbot && cd keepbot && tar -zxvf keepbot.tar.gz && rm -f keepbot.tar.gz && sudo chmod +x install.sh && sudo chmod 775 install.sh; sudo ./install.sh
```

## Updating

Update KEEP Bot:

```sh
keepbot update
```

**NOTE**: Please verify the shell code at /usr/lib/keepbot before using KEEP Bot again.

## Upgrading

Upgrade Docker and your KEEP Random Beacon node:

```sh
keepbot upgrade
```

## To do

* Don't repeat common phrases, which includes keepbot version in presentation
* Common modules (update)
* Organize steps into different sh files (Resume steps after closing the term window)
* Use settings file for app data
* Identify if installation is at first time or don't
* Support tBTC ECDSA alongside KEEP Random Beacon
* Support both Ropsten testnet and mainnet
* Useful commands and troubleshooting