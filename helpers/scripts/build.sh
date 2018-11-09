echo " [NOTE!] Make sure golang v1.10.3 (exactly) is installed"
echo ''
cd "$(dirname "$0")"

path=${1:-/node}
source=${2:-/usr/tmp/eth}


if [ $# -eq 0 ]
  then
    echo " [?] Where to install go-ethereum data and bin files?  [/node/]"
	read source
	path=${1:-/node}

	echo " [?] Where is the source files of the go-ethereum?  [/usr/tmp/eth]"
	read source
	source=${source:-/usr/tmp/eth}
fi

echo " [-] Deleting old folder ($path)..."
sleep 1
rm -rf $path

# Commented, since it'll be executed now by the 'setup.sh' script.
# Clone, using Eli's Personal-Access-Token (expires in 10/10/2019)
#git clone https://usxsrn7wkgey7hsft5rzmchebmlrjn4lja2mti4hconoormz45dq@bridgez.visualstudio.com/GCAC/_git/Blockshine --branch development $source

#cp $source $source -r
#chmod +x $source/build/*
cd $source

echo " [-] Building..."
sleep 1
make all

echo " [-] Copying bin files from ($source) to ($path)..."
sleep 1
mkdir -p $path
mkdir -p $path/pre-defined
# -- Copy go-etheruem bin
cp $source/build/bin/ $path/bin -r
# -- Copy Bridgez helper scripts
cp $source/bridgez/* $path/ -r
# -- Remove build.sh from folder
rm $path/build.sh

echo " [-] Adding path to /etc/profile..."
sleep 1
echo 'export PATH=$PATH:/node/bin/' >> /etc/profile
source /etc/profile 

echo " [-] Done! Now go to $path and run 'deployNodes.sh' script."
sleep 5