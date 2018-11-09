cd "$(dirname "$0")"

path=${1:-/node/env/node}
port=${2:-39393}
bootnode=${3:-127.0.0.1}
rpcport=${4:-8545}
rpcapi=${5:-personal,db,eth,net,web3,txpool,miner}
pswd=${6:-$path/password.txt}

echo pswd $pswd
account=`cat $path/account.txt`
pswd="$path/password.txt"
echo account $account

geth --datadir $path --syncmode 'full' --rpc --rpcaddr "0.0.0.0" --rpcapi $rpcapi --rpcport $rpcport --bootnodes enode://1b348d3461882122b1ca365add1a138b08a46b3b785c15daf6fbb93e8580418c2b0f57f7e00f21479a1c3f5a06be397f01bbd34275e84a021e9e4c558620099b@$bootnode:30301 --port $port --gasprice 0 --mine --unlock $account --password $pswd --networkid 29794 --identity "Althereum Miner #1" 

# More optional params:
#   —nodiscover
#   --mine --unlock $account --password $pswd
#   --rpccorsdomain "*"
#   --etherbase $address 


# -----------------------------------
# [NOTE] Regarding unlocking via command line: 
# When not unlocking the account from command line, the nodes has to be unlocked manually before starting to mine. 
# This MEANS you have to remove the '--mine' param from geth command (or at least run 'miner.stop()').
# 1) Connect to node: geth attach http://0.0.0.0:8545
# 2) Set etherbase: miner.setEtherbase(eth.accounts[0])
# 3) Unlock account: personal.unlockAccount(eth.accounts[0], "123", 0) // Please note the last '0', this means that the unlock will not expire.
# 4) Start mining: miner.start()
# -- This should be done per each node. 
# -- Otherwise, if it's assumed that nodes are not mining (gasprice=0) then it could be a reasonable risk to unlock the nodes by default, 
# as long as they're not exposed to the public network. This will mean a 'client' node (node that is synced but not minning) 
# will have to be set up and this one should be exposed (preferred with custom ports).

# [Examples]:
# ./startNode.sh /node/env/node1 39393 127.0.0.1 8545 clique,personal,db,eth,net,web3,txpool,miner &
# ./startNode.sh /node/env/node2 39394 127.0.0.1 8455 clique  &

