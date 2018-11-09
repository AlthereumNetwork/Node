# This script is supposed to simulate a deployment of a node configuration (nodekey, account address and password).
# The predefined nodes are in the repo `Blockchain Deployment` under `predefined_nodes` directory. 
# You can specify which one of the nodes you want to copy and deploy: `./testDeploy node2` .
cd "$(dirname "$0")"

nodename=${1:-node1}
path=${2:-/node/env/$nodename}

git clone "https://usxsrn7wkgey7hsft5rzmchebmlrjn4lja2mti4hconoormz45dq@bridgez.visualstudio.com/GCAC/_git/Blockchain%20Deployment" --branch develop temp

rm -rf $path
mkdir -p $path

mv temp/predefined_nodes/$nodename/* $path
rm -rf temp

echo " [>] Node definition was copied successfully."

# echo " [>] Generating genesis block..."
# ../initNode.sh $path

echo " [>] Done."
echo " [>] Now you can init the node (create genesis) and start the node (startNode.sh /node/env/node1 39393 127.0.0.1 8545 personal,db,eth,net,web3,txpool,miner)"