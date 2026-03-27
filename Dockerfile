FROM ghcr.io/openclaw/openclaw:latest

COPY init.sh /init.sh

EXPOSE 8080

ENTRYPOINT ["sh", "/init.sh"]
