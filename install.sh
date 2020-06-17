#!/bin/bash

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
      |_.__/   \___/   \__|
                      

  https://daniellmesquita.eth.link/keepbot
  
--------------------------------------------

EOF

echo "Welcome to the Keep Network!"

read -p "Do you want to continue? [Y/n]" -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

echo ""
echo "You're here, probably because you got interested in tBTC or the KEEP token 😉"
echo "" && echo "--------------------------------------------"
echo "So, let's begin? 😊"
echo "I assume you want to run a node for tBTC or KEEP tokens!"
echo "-"
echo "👉 For KEEP, we call it 'Random Beacon node', where you stake your KEEP to earn Ether (ETH) through signing groups."
echo "👉 For tBTC, we call it 'ECDSA node', where you stake your KEEP and bond Ether (ETH) to earn tBTC tokens (and later being able to redeem'em to Bitcoin)."
echo "-"
echo "But, oooooh... 😞"
echo "ECDSA node setup isn't yet available in KEEP Bot, BUT YOU CAN COME WITH GOOD NEWS TO YOUR HOUSE: RANDOM BEACON NODE IS AVAILABLE AND WE'LL HELP THOU TO SETUP IT. 🥳"
echo "For the ECDSA node, keep an eye into Keep Bot's site (shown above in the SH presentation) or in our GitHub repo: https://github.com/DaniellMesquita/keepbot"