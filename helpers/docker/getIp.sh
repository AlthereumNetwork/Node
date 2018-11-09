container=${1:-althereum}
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $container