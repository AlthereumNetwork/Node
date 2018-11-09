path=${1:-/node/env/node1}
geth attach ipc:/$path/geth.ipc

# personal.newAccount('seed')
# personal.unlockAccount(web3.eth.coinbase, "seed", 15000)
# miner.start()