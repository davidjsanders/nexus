docker run \
  --restart=always \
  --network ${nexus_networks[0]} \
  --network ${nexus_networks[1]} \
  --hostname=nexus_traefik \
  --volume $(pwd)/config/local-traefik.toml:/etc/traefik/traefik.toml \
  -p 80:80 \
  -p 8080:8080 \
  --detach=true \
  --name nexus_traefik \
  docker-registry.gwl.bz:18080/traefik:v1.7.7-alpine
