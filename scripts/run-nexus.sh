docker run \
  --restart=always \
  --network ${nexus_networks[0]} \
  --network ${nexus_networks[1]} \
  --hostname=nexus_pro \
  --volume nexus_pd:/nexus-data \
  --volume nexus_ur:/userRoot \
  --volume nexus_blobs:/blob-store \
  --env "INSTALL4J_ADD_VM_PARAMS=-Djava.util.prefs.userRoot=/userRoot" \
  --label traefik.entryPoints=http \
  --label traefik.enable="true" \
  --label traefik.ui.docker.network=nexus_net \
  --label traefik.ui.backend="nexus-ui" \
  --label traefik.ui.frontend.rule="PathPrefix: /nexus-dev" \
  --label traefik.ui.port=8081 \
  --label traefik.registry.backend="nexus-registry-dev" \
  --label traefik.registry.frontend.rule="Host: docker-registry-dev.gwl.bz" \
  --label traefik.registry.port=18080 \
  --label traefik.prireg.backend="reg-private" \
  --label traefik.prireg.frontend.rule="Host: docker-registry-private.gwl.bz" \
  --label traefik.prireg.port=18081 \
  --detach=true \
  --name nexus_pro \
  dsanderscan/nexus3:dev-0.1
  