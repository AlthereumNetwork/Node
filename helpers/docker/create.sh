# docker run --name althereum -p 8545:8545 althereum
# docker build -t althereum . && docker run -p 8545:8545 -dit althereum

docker rm althereum
docker run -p 8545:8545 --name althereum -it althereum /bin/bash -l
