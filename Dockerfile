FROM ghcr.io/openclaw/openclaw:latest

COPY init.sh /init.sh

ENV OPENCLAW_HEADLESS=true

EXPOSE 8080

CMD ["sh", "/init.sh"]
