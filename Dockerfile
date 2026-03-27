FROM ghcr.io/openclaw/openclaw:latest

COPY start.sh /app/start.sh

ENV OPENCLAW_HEADLESS=true

EXPOSE 8080

CMD ["sh", "/app/start.sh"]
