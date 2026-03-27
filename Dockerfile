FROM ghcr.io/openclaw/openclaw:latest

ENV PORT=8080
ENV CLAWDBOT_GATEWAY_PORT=8080
ENV CLAWDBOT_GATEWAY_BIND=0.0.0.0

EXPOSE 8080

CMD ["node", "openclaw.mjs", "gateway", "--allow-unconfigured"]
