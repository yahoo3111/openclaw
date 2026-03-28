FROM ghcr.io/openclaw/openclaw:latest
COPY init.sh /init.sh
EXPOSE 10000
ENTRYPOINT ["sh", "/init.sh"]
