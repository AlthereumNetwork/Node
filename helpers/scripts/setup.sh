datadir=${1:-/node/env/node}
echo " [>] Setup - $datadir"

# Initialization:
rm -rf /node/env/node/
# geth account new --datadir $datadir --password="/node/pre-defined/node/password.txt"
geth init --datadir="$datadir" /node/pre-defined/genesis_minimal.json
cp -r /node/pre-defined/node/* $datadir 

# Start console
# geth --datadir="$datadir" --networkid 666 --nodiscover console 
# --identity "Althereum Miner #1"
# bootnode -nodekey pre-defined/bootnode.key > /node/env/bootnode.log &
# ./scripts/startNode.sh /node/env/node 39393 127.0.0.1 8545 clique,personal,db,eth,net,web3,txpool,miner 

# /node/pre-defined/password.txt

# self=enode://1b348d3461882122b1ca365add1a138b08a46b3b785c15daf6fbb93e8580418c2b0f57f7e00f21479a1c3f5a06be397f01bbd34275e84a021e9e4c558620099b@[::]:30301