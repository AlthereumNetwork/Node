cd "$(dirname "$0")"

if [ $# -eq 0 ]
  then
    echo "Please provide node folder path as param"
fi

path=${1:-/node/env/node1}
rm -rf $path/geth/
geth --datadir $path init pre-defined/genesis_minimal.json --networkid 29794
