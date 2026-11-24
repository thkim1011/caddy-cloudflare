# Caddy with the Cloudflare DNS plugin, so it can get certificates through a
# Cloudflare DNS record (Let's Encrypt's DNS challenge). The image is tagged
# with this version; bump it to upgrade Caddy.
ARG CADDY_VERSION=2.11.9

FROM caddy:${CADDY_VERSION}-builder AS builder

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:${CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
