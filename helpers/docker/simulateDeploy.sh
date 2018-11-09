docker start althereum

path=/node
node=node1

echo "[>] Resetting environment ($path/env)..."
docker exec -w $path -ti althereum bash -cl " echo '$path/env' >> /usr/tmp/test "
docker exec -w $path -ti althereum bash -cl " rm -rf $path/env "

echo "[>] Simulating deployment of Nodekey of $node..."
docker exec -w $path -ti althereum bash -cl " ./testNodes/testDeploy.sh $node && cp -r ./pre-defined/boot.key $path/env"
echo "[>] Generating genesis block..."
docker exec -w $path -ti althereum bash -cl " ./initNode.sh $path/env/$node "
echo "[>] Statting bootnode..."
docker exec -w $path -ti althereum bash -cl " ./startBootnode.sh $path/env "
echo "[>] Starting $node..."
docker exec -w $path -ti althereum bash -cl " ./startNode.sh $path/$node 39393 0.0.0.0 8545 clique,personal,db,eth,net,web3,txpool,miner  & "

echo "[>] Connecting to instance... "
docker exec -w $path -ti althereum bash -l
