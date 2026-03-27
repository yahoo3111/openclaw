FROM ghcr.io/openclaw/openclaw:latest

ENV OPENCLAW_GATEWAY_PORT=8080
ENV OPENCLAW_GATEWAY_BIND=lan
ENV OPENCLAW_HEADLESS=true

EXPOSE 8080

CMD ["node", "openclaw.mjs", "gateway", "--allow-unconfigured"]
