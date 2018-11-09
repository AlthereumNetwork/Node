#!/bin/bash

# clear screen:
printf "\033c"
tput reset

cd "$(dirname "$0")"
path=${1:-/node}
echo "////////////////////////////////////////////////////////"
echo "////////////////////////////////////////////////////////"
echo "////////////////////////////////////////////////////////"
echo " [-] Starting... Using path=$path/env (copying from $path/pre-defined)..."

echo " [-] Killing all alive processes (bootnode and nodes)..."
sleep 1
./killAll.sh

echo " [-] Copying pre-defined nodes ($path/pre-defined) to local machine $path/env..."
sleep 1
rm -rf $path/env
mkdir -p $path/env
cp -r ../pre-defined/* $path/env
# cp -r pre-defined/node1 $path/env
# cp -r pre-defined/node2 $path/env
# cp pre-defined/boot.key $path/env
# cp pre-defined/accounts.txt $path/env
# cp pre-defined/password.txt $path/env

./testDeploy.sh node1
./testDeploy.sh node2
../initNode.sh env/node1
../initNode.sh env/node2

echo " [-] Starting bootnode..."
sleep 3
../startBootnode.sh $path/env

echo " [-] Starting nodes..."
sleep 3
./startAllTestNodes.sh $path/env &

echo " [-] DONE!"
sleep 3
