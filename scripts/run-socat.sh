docker run \
  --restart=always \
  --network ${nexus_networks[0]} \
  --network ${nexus_networks[1]} \
  --hostname=nexus_socat \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --privileged \
  --detach=true \
  --name nexus_socat \
  docker-registry.gwl.bz:18080/alpine/socat:1.0.3 \
    tcp-listen:2375,fork,reuseaddr unix-connect:/var/run/docker.sock
