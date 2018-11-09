path=${1:-/node/env/}

cd "$(dirname "$0")"

../startNode.sh $path/node1 39393 127.0.0.1 8545 clique,personal,db,eth,net,web3,txpool,miner  &
../startNode.sh $path/node2 39394 127.0.0.1 8455 clique,personal,db,eth,net,web3,txpool,miner  &
#&>/dev/null &