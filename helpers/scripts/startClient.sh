# This script is intended to start a client node (does not mine/seal), it's read only and connects to other existing miners.
# This instance can be safely exposed to the outer network.

cd "$(dirname "$0")"

path=${1:-/node/env/node}
port=${2:-39393}
bootnode=${3:-127.0.0.1}
rpcport=${4:-8545}
rpcapi=${5:-eth,net,web3}

echo "bootnode = $bootnode"

geth --datadir $path --syncmode 'full' --rpc --rpcaddr "0.0.0.0" --rpcapi $rpcapi --rpcport $rpcport --bootnodes enode://8b8f0206b7e80dafbd890b706b4b897b3b4ded48a8b4e46a66593870bf7fda407253e17a0e43a383b151aee1408d6f8c6a400212253dab3e18ac094a5f3c65d8@$bootnode:39391 --port $port --networkid 29794 --identity "Althereum Client" 
