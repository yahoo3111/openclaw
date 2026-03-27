FROM ghcr.io/openclaw/openclaw:latest

COPY start.sh /home/node/start.sh

ENV OPENCLAW_HEADLESS=true

EXPOSE 8080

CMD ["sh", "/home/node/start.sh"]
