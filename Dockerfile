FROM ghcr.io/openclaw/openclaw:latest

COPY openclaw.json /home/node/.openclaw/openclaw.json

ENV OPENCLAW_HEADLESS=true

EXPOSE 8080

CMD ["node", "openclaw.mjs", "gateway", "--allow-unconfigured"]
