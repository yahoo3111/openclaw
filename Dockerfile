FROM ghcr.io/openclaw/openclaw:latest

ENV OPENCLAW_HEADLESS=true
ENV OPENCLAW_GATEWAY_CONTROL_UI_DANGEROUSLY_ALLOW_HOST_HEADER_ORIGIN_FALLBACK=true

EXPOSE 8080

CMD ["node", "openclaw.mjs", "gateway", "--port", "8080", "--bind", "lan", "--allow-unconfigured"]
