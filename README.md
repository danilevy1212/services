# Services

A collection docker compose files constituting the services I currently self-host.

- **[Jellyfin](jellyfin/)** - Comfy, private and self-hosted media server.
- **[qbittorrent](qbittorrent/)** - Always online, remote torrent manager.
- **[syncthing](syncthing/)** - Decentralized p2p file sharing.
- **[freshrss](https://freshrss.org/index.html)** - FreshRSS is a self-hosted RSS and Atom feed aggregator.
- **[dondominio](https://github.com/dondominio/dondns-bash)** - Dynamic DNS for the Don Dominio DNS provider.
- **[caddy](https://hub.docker.com/_/caddy)** - Reverse proxy service.
- ~~**[pi-hole](https://pi-hole.net/)** - Say no to ads and trackers, on the DNS level.~~ *Temporarily decommissioned*
- **[pyload](https://pyload.net/)** - Free (as in freedom) direct link download manager.
- **[MCPHUB](mcphub/)** - MCP server hub for managing multiple MCP servers.

## Upgrade

To upgrade and rebuild all the images, run:

```bash
./upgrade.sh
```

This script will run the `upgrade.sh` on each service folder, which is responsible for upgrading each container image.
