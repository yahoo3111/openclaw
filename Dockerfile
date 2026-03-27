FROM ghcr.io/openclaw/openclaw:latest

COPY start.sh /home/node/start.sh
RUN chmod +x /home/node/start.sh

ENV OPENCLAW_HEADLESS=true

EXPOSE 8080

WORKDIR /home/node

CMD ["/home/node/start.sh"]
