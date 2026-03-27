FROM ghcr.io/openclaw/openclaw:latest

COPY init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 8080

ENTRYPOINT ["/init.sh"]
