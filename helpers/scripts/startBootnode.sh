path=${1:-/node/env}
bootnode -nodekey $path/boot.key -verbosity 9 &> $path/bootnode.log &