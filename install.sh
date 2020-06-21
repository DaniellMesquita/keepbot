#!/bin/bash

dna_ascii=""" 
-. .-.   .-. .-.   .-. .-.   .
  \   \ /   \   \ /   \   \ /
 / \   \   / \   \   / \   \
~   `-~ `-`   `-~ `-`   `-~ `-
"""
#
echo "${dna_ascii}"
#
cat << "EOF"

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
      |_.__/   \___/   \__|  1.2.3
                      

  https://daniellmesquita.eth.link/keepbot
  
--------------------------------------------

EOF

echo "Welcome to the Keep Network!"

firstime=true

if [ "$firstime" = "true" ]
   then
      read -p "Do you want to continue? [Y/n]" -n 1 -r
      echo    # (optional) move to a new line
      if [ ! $REPLY =~ ^[Yy]$ ]
      then
            exit 1
      fi

      echo ""
      echo "You're here, probably because you got interested in tBTC or the KEEP token 😉"
      echo "" && echo "-" && echo ""
      echo "So, let's begin? 😊"
      echo "I assume you want to run a node for tBTC or KEEP tokens!"
      echo "--------------------------------------------"
      echo "👉 For KEEP, we call it 'Random Beacon node', where you stake your KEEP to earn Ether (ETH) through signing groups."
      echo "👉 For tBTC, we call it 'ECDSA node', where you stake your KEEP and bond Ether (ETH) to earn tBTC tokens (and later being able to redeem'em to Bitcoin)."
      echo "--------------------------------------------"
      echo "But, oooooh... 😞"
      echo "ECDSA node setup isn't yet available in KEEP Bot, BUT YOU CAN COME WITH GOOD NEWS TO YOUR HOUSE: RANDOM BEACON NODE IS AVAILABLE AND WE'LL HELP THOU TO SETUP IT. 🥳"
      echo "For the ECDSA node, keep an eye into Keep Bot's site (shown above in the SH presentation) or in our GitHub repo: https://github.com/DaniellMesquita/keepbot"
	  echo "Donations are much appreciated, pls buy me a Husky dog:"
	  echo "Standard: 0xDDfC2e10702d8A781727A34D83B3bb3CA94a3E91 / daniellmesquita.eth"
	  echo "Argent: 0xc7dffdc95483bbf8b372bce78f1d9b2a7a1e8143 / daniell.argent.xyz"
	  echo "------"
	  echo "Please note that Keep Bot is on early development stage, and currently focused in testnet (Ropsten) and the random beacon. New updates are coming."
	  echo "${dna_ascii}"
	  
      read -p "Shall we proceed to STEP 2? [Y/n]" -n 1 -r
      echo    # (optional) move to a new line
      if [ ! $REPLY =~ ^[Yy]$ ]
      then
            exit 1
      fi
	  
	  echo "${dna_ascii} Step 2:"
	  echo "Minimum recommended requirements:"
	  echo "👉 Linux basic knowledge"
	  echo "👉 VPS with 2 vCPU, 4 GiB RAM, 1 GiB HDD, Linux Debian/Ubuntu 18.04 or better"
	  echo "👉 Browser with MetaMask extension installed (Brave/Firefox/Chromium)"
	  echo "👉 Have the force which may be with you, and keep your node 24/7 online"
	  echo "Some steps are based in the good tutorial made by @novysf on Medium."
	  echo "--------------------------------------------"
	  echo "Go to https://myetherwallet.com and create a new wallet and select “By Keystore File”, set the password and write down this passphrase/password for later use. Click NEXT. AND REMEMBER, TO REMEMBER YOUR WALLET PASSWORD YOU'VE INPUT!"
	  echo "Note: don't use your main wallet/beneficiary address; for security reasons, you've generated a new wallet for exclusive use with your KEEP nodes. It's OK to use a different beneficiary address and operator address."
	  echo "-"
	  echo "On the next page, in MyEtherWallet press “Download Keystore File”. As a result you will have a file like “UTC — 2020–04–11T21–11–10.519Z — 8f076df6434f7a8da4793118f9f8cf82f958e319”. Rename it exactly to “keep_wallet.json” for later use in this guide."
	  	  echo "--------------------------------------------"
	  
	        read -p "AFTER DONE (WAIT AND, ONLY AFTER DONE!) proceed to STEP 3? [Y/n]" -n 1 -r
      echo    # (optional) move to a new line
      if [ ! $REPLY =~ ^[Yy]$ ]
      then
            exit 1
      fi
	  
	  echo "${dna_ascii} Step 3:"
	  echo "Open keep_wallet.json with your favorite text editor and find the address section. Example 'address':'DDfC2e10702d8A781727A34D83B3bb3CA94a3E91'. Write down this address (inside the quotes, which in this example starts in DD and ends in 91, BUT ANOTATE YOUR OWN INSTEAD!) for using in this script."
	  echo "--------------------------------------------"
	  echo "Soooo... ...what is your wallet address? (you can add the 0x before)"
	  read -p "Address: "  ethaddrtmp
	  if [[ "$ethaddrtmp" =~ .*"0x".* ]]
	     then
			ethaddr="$ethaddrtmp"
			echo "DONE! Your address is $ethaddr! (thanks for adding the 0x, kisses)"
	 	 else
	  	  	ethaddr="0x$ethaddrtmp"
			echo "DONE! Your address is $ethaddr! Please note we've added a 0x before this address, which is the standard for all Ethereum addresses!"
	  fi
	  
	        read -p "If you say no, this script will restart. Is '$ethaddr' your address? [Y/n]" -n 1 -r
      echo    # (optional) move to a new line
      if [ ! $REPLY =~ ^[Yy]$ ]
      then
            exit 1
      fi
	  
	  echo "--------------------------------------------"
	  echo "Ok, your node operator address is $ethaddr! let's proceed to the step 4!"
	  # Your ETH Wallet.
      export ETH_WALLET="$ethaddr"
      echo "export KEEP_CLIENT_ETHEREUM_PASSWORD=$ethpswdtmp" >> ~/.profile
      echo "export KEEP_CLIENT_ETHEREUM_PASSWORD=$ethpswdtmp" >> $HOME/.bashrc
	  
	  echo "${dna_ascii} Step 4:"
      echo "Now, we will fuel your operator address with testnet KEEP tokens!"
	  
	  echo "Keep Bot will automagically do it for you..."
	  curl https://us-central1-keep-test-f3e0.cloudfunctions.net/keep-faucet-ropsten?account=$ETH_WALLET
	  
	  echo "--------------------------------------------"
	  echo "Done!"
	  
	        read -p "Proceed to STEP 5? [Y/n]" -n 1 -r
      echo    # (optional) move to a new line
      if [ ! $REPLY =~ ^[Yy]$ ]
      then
            exit 1
      fi	

	  echo "${dna_ascii} Step 5:"
      echo "Now, for the tx fees you'll need, we will fuel your operator address with testnet Ether!"

      echo "Keep Bot will automagically do it for you..."
	  curl https://faucet.ropsten.be/donate/$ETH_WALLET
      	  
	  echo "--------------------------------------------"
	  echo "Done!"
	  
	        read -p "Proceed to STEP 6? [Y/n]" -n 1 -r
      echo    # (optional) move to a new line
      if [ ! $REPLY =~ ^[Yy]$ ]
      then
            exit 1
      fi	  
	  
	  echo "${dna_ascii} Step 6:"
	  echo "Import your keep_wallet.json into MetaMask and change the MetaMask network to Ropsten Test Network. If you have any doubt, feel free to ask in KEEP's Discord: https://discord.gg/jqxBU4m"
	  
	        read -p "AFTER DONE (WAIT AND, ONLY AFTER DONE!) proceed to STEP 7? [Y/n]" -n 1 -r
      echo    # (optional) move to a new line
      if [ ! $REPLY =~ ^[Yy]$ ]
      then
            exit 1
      fi	

	  echo "${dna_ascii} Step 7:"
	  echo "Let’s start the delegation process."
	  echo "--------------------------------------------"
	  echo "In your browser navigate to https://dashboard.test.keep.network/tokens. In the TOKENS section, you should see 300k granted tokens and also verify that you have 0 KEEP tokens staked."
	  echo "Probably you will need images as reference. Feel free to head up to this tutorial: https://medium.com/@novysf/run-a-keep-network-testnet-node-37096946af35 (it's outdated, but the images will help you)"
	  echo "--------------------------------------------"
	  echo "Choose Grant ID, Token amount (300k in my case, you can stake less, but not less than 100k), Fill all the addresses fields with your ether wallet and press DELEGATE STAKE. MetaMask popup windows will ask you to confirm the transaction."
	  echo "After a successful transaction, you will see 300k tokens staked. Nice, but also we need to authorize contracts in the APLICATIONS section: https://dashboard.test.keep.network/applications/random-beacon"
	  echo "Here you have to press on the AUTHORIZE button for every contract! Then done!"
	  
	        read -p "AFTER DONE (WAIT AND, ONLY AFTER DONE!) proceed to STEP 8? [Y/n]" -n 1 -r
      echo    # (optional) move to a new line
      if [ ! $REPLY =~ ^[Yy]$ ]
      then
            exit 1
      fi	
	  
	  echo "${dna_ascii} Step 8:"
	  echo "Create your Infura account (or just login if you already have one)."
	  echo "--------------------------------------------"
      echo "Go to https://infura.io/register and create an account (if you don't have one)."
	  echo "Log in with your email and password in https://infura.io/login"
	  echo "Now, go to https://infura.io/dashboard/ethereum/ and create a new project, and you can name it 'KEEP'"
	  echo "--------------------------------------------"
      echo "In your new project, go to the SETTINGS tab, and in the KEYS section, change ENDPOINTS to ROPSTEN."
	  echo "--------------------------------------------"
	  echo "There is a section called PROJECT ID. There is a button: use it to copy to clipboard! Yeah, copy your project ID; you'll need it... ...right now!"
	  
	  echo "${dna_ascii}"
	  echo "Soooo... ...what is your Infura project's ID?"
	  read -p "PROJECT ID: "  projidtmp
	  
	        read -p "If you say no, no, no: you aren't Amy Winehouse and this script will restart. Is '$projidtmp' your Infura project ID? [Y/n]" -n 1 -r
      echo    # (optional) move to a new line
      if [ ! $REPLY =~ ^[Yy]$ ]
      then
            exit 1
      fi
	  
	  echo "--------------------------------------------"
	  echo "Ok, your PROJECT ID is $projidtmp! let's proceed to the step 9!"
      # Your Infura PROJECT ID.
      export INFURA_PROJECT_ID="$projidtmp"
	  echo "export KEEP_CLIENT_INFURA_PROJECT_ID=$projidtmp" >> ~/.profile
	  echo "export KEEP_CLIENT_INFURA_PROJECT_ID=$projidtmp" >> $HOME/.bashrc
	  
	  echo "${dna_ascii} Step 9:"
      echo "THANKS FOR ALL YOUR AMAZING EFFORTS! Now, you can take a coffee as Keep Bot will handle all your server setting!"
	  
	  echo "--------------------------------------------"
	  echo "As a good penguin, updating APT..."
	  sudo apt-get update
	  
	  echo "--------------------------------------------"
	  echo "Installing ufw..."
	  sudo apt-get install ufw
	  echo "Setting up ufw..."
	  sudo ufw allow 22/tcp
      sudo ufw allow 3919/tcp
      yes | sudo ufw enable
	  
	  echo "--------------------------------------------"
	  echo "Installing nano..."
	  sudo apt-get install nano
	  
	  echo "--------------------------------------------"
	  echo "Installing Docker..."
      sudo apt-get remove docker docker-engine docker.io
      sudo apt install docker.io curl -y
	  echo "Setting up Docker..."
	  sudo systemctl start docker
      sudo systemctl enable docker
	  echo "Testing Docker..."
      sudo docker --version
	  
	  echo "--------------------------------------------"
	  echo "Installing KEEP's docker image..."
	  sudo docker pull keepnetwork/keep-client
	  
	  echo "--------------------------------------------"
	  echo "Setting KEEP directories..."
	  mkdir -p $HOME/keep-client/config
      mkdir -p $HOME/keep-client/keystore
      mkdir -p $HOME/keep-client/persistence
	  
	  echo "Setting your server's IP..."
	  # Get your server's IP
      export SERVER_IP=$(curl -s ipecho.net/plain)
	  echo "export SERVER_IP=$(curl -s ipecho.net/plain)" >> ~/.profile
	  echo "export SERVER_IP=$(curl -s ipecho.net/plain)" >> $HOME/.bashrc
	  
	  echo "Setting up config.toml..."
	  sudo rm -f /tmp/config.toml
	  cat <<EOF >>/tmp/config.toml
# Connection details of Ethereum blockchain.
[ethereum]
 URL = "wss://ropsten.infura.io/ws/v3/$INFURA_PROJECT_ID"
 URLRPC = "https://ropsten.infura.io/v3/$INFURA_PROJECT_ID"# Keep operator Ethereum account.
[ethereum.account]
 Address = "$ETH_WALLET"
 KeyFile = "/mnt/keep-client/keystore/keep_wallet.json"# Keep contract addresses configuration.
# This address might change and need to be replaced from time to time
# if it does, the new contract address will be listed here:
# https://github.com/keep-network/keep-client/blob/master/docs/run-keep-client.adoc
[ethereum.ContractAddresses]
 KeepRandomBeaconOperator = "0x440626169759ad6598cd53558F0982b84A28Ad7a"
 TokenStaking = "0xEb2bA3f065081B6459A6784ba8b34A1DfeCc183A"
 KeepRandomBeaconService = "0xF9AEdd99357514d9D1AE389A65a4bd270cBCb56c"# Keep network configuration.
# This addresses might change and need to be replaced from time to time
# if it does, the new contract address will be listed here:
# https://github.com/keep-network/keep-client/blob/master/docs/run-keep-client.adoc
# Addresses of applications approved by the operator.
[SanctionedApplications]
  Addresses = [
    "0x2b70907b5c44897030ea1369591ddcd23c5d85d6",
]
[Storage]
 DataDir = "/mnt/keep-client/persistence"
[LibP2P]
 Peers = ["/dns4/testnet.keep-client.hashd.dev/tcp/3919/ipfs/16Uiu2HAmJsBiNVFNxsJ27NSQEByv39B1M7AKx5FrAc1htqYhHGhU",
"/dns4/testnet2.keep-client.hashd.dev/tcp/3919/ipfs/16Uiu2HAmAV3sNGXTpdZCguUEd5QqMmg13WZ5dBTtjbhYeQmTHwgM"]
 Port = 3919
 # Override the node's default addresses announced in the network
 AnnouncedAddresses = ["/ip4/$SERVER_IP/tcp/5678"]# Storage is encrypted
[TSS]
# Timeout for TSS protocol pre-parameters generation. The value
# should be provided based on resources available on the machine running the client.
# This is an optional parameter, if not provided timeout for TSS protocol
# pre-parameters generation will be set to .
  PreParamsGenerationTimeout = "2m30s"
EOF
	  
	  echo "Do you remember the keep_wallet.json file you've created in the first steps?"
	  echo "Now, copy the content of your keep_wallet.json file to paste in the server."
	  
	        read -p "AFTER DONE (WAIT AND, ONLY AFTER DONE!) proceed? [Y/n]" -n 1 -r
      echo    # (optional) move to a new line
      if [ ! $REPLY =~ ^[Yy]$ ]
      then
            exit 1
fi
	  
	  read -p "Now that you've copied the contents of keep_wallet.json, you'll need to paste it in the window which will open (nano text editor) and save the file. Type Y to proceed. " -n 1 -r
	  echo    # (optional) move to a new line
	  if [ ! $REPLY =~ ^[Yy]$ ]
	  then
         exit 1
fi
	  
	  rm $HOME/keep-client/config/config.toml
	  
      if [ -e /tmp/config.toml ]
      then
         cp /tmp/config.toml $HOME/keep-client/config/config.toml
fi

      if [ -e $HOME/keep-client/config/config.toml ]
      then
         sudo rm -f /tmp/config.toml
fi

      nano $HOME/keep-client/keystore/keep_wallet.json
	  
      read -p "Shall we proceed to STEP 10? [Y/n]" -n 1 -r
      echo    # (optional) move to a new line
      if [ ! $REPLY =~ ^[Yy]$ ]
      then
            exit 1
      fi
	  
	  echo "${dna_ascii} Step 10:"	
      echo "Remember that, when you generate your wallet .json file in MyEtherWallet, you've setup a passphrase/password for it? You will need to enter it bellow."
	  
	  echo "--------------------------------------------"
      read -s -p "Enter Password: " ethpswdtmp
	  # Set password permanently in VPS user's profile
      echo "export KEEP_CLIENT_ETHEREUM_PASSWORD=$ethpswdtmp" >> ~/.profile
	  echo "export KEEP_CLIENT_ETHEREUM_PASSWORD=$ethpswdtmp" >> $HOME/.bashrc
      echo "Done!"

      echo "Installing keepbot..."
      sudo cp -rT -d -f --preserve=all . /usr/lib/keepbot
	  sudo cat > /usr/bin/keepbot << ENDOFFILE
#!/bin/bash

source /usr/lib/keepbot/keepbot
ENDOFFILE
	  sudo cat > /usr/bin/keep-bot << ENDOFFILE
#!/bin/bash

source /usr/lib/keepbot/keepbot
ENDOFFILE

	  sudo chmod +x /usr/bin/keepbot
	  sudo chmod +x /usr/bin/keep-bot

      echo "${dna_ascii} DONE!"
      echo "You've sucessfully installed keepbot! If you need anything, just type the 'keepbot' command. But there is more: just one step away from running your KEEP Random Beacon node!"
	  echo "*** NOTE: Upgrading will put your node temporarily offline while working. Remember to experiment the 'keepbot upgrade' in testnet, so you can know if you can securely upgrade your node in mainnet without having your KEEP tokens slashed. ***"
	  
	  read -p "Type Y to start running your Ropsten testnet KEEP Random Beacon node!" -n 1 -r
	  echo    # (optional) move to a new line
	  if [ ! $REPLY =~ ^[Yy]$ ]
	  then
         exit 1
	  fi
	  
	  echo "FINAL STEP! Setting up..."
	  export KEEP_CLIENT_ETHEREUM_PASSWORD=$ethpswdtmp
	  sudo docker run -d \
--restart always \
--entrypoint /usr/local/bin/keep-client \
--volume $HOME/keep-client:/mnt/keep-client \
--env KEEP_ETHEREUM_PASSWORD=$KEEP_CLIENT_ETHEREUM_PASSWORD \
--env LOG_LEVEL=debug \
--name keep-client \
-p 3920:3919 \
keepnetwork/keep-client:latest \
--config /mnt/keep-client/config/config.toml start
	
   else
      echo "You've already used this script to install your random beacon node. New updates are coming with new usability for Keep Bot. If you have any question, type the 'keep-bot help' command."
fi