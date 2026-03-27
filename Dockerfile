FROM ghcr.io/openclaw/openclaw:latest

ENV OPENCLAW_HEADLESS=true

EXPOSE 8080

CMD ["node", "openclaw.mjs", "gateway", "--port", "8080", "--bind", "lan", "--allow-unconfigured"]
