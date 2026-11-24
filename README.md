# caddy-cloudflare

[Caddy](https://caddyserver.com) with the
[Cloudflare DNS plugin](https://github.com/caddy-dns/cloudflare), for
`linux/arm64` (Raspberry Pi). With it, Caddy gets Let's Encrypt certificates
through a Cloudflare DNS record, so a server only reachable on your own network
can still have a trusted certificate.

```
ghcr.io/thkim1011/caddy-cloudflare:v2.11.9   # pinned Caddy version
ghcr.io/thkim1011/caddy-cloudflare:latest
```

GitHub Actions builds and pushes it on every push to main, monthly (for base
image and plugin fixes; the version tag moves to the rebuild), and on demand
from the Actions tab. To upgrade Caddy, bump `CADDY_VERSION` in the
`Dockerfile`.

In a Caddyfile:

```
example.com {
	tls {
		dns cloudflare {env.CLOUDFLARE_API_TOKEN}
	}
	reverse_proxy app:3000
}
```

The token needs Zone → DNS → Edit on that domain's zone.
