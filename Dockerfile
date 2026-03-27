FROM ghcr.io/openclaw/openclaw:latest

COPY init.sh /init.sh

ENV OPENCLAW_HEADLESS=true

EXPOSE 8080

ENTRYPOINT ["/init.sh"]
