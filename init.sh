#!/bin/sh
mkdir -p /home/node/.openclaw
cat > /home/node/.openclaw/openclaw.json << 'CONFIG'
{
  "gateway": {
    "port": 8080,
    "bind": "0.0.0.0",
    "controlUi": {
      "dangerouslyAllowHostHeaderOriginFallback": true
    }
  }
}
CONFIG
exec docker-entrypoint.sh node openclaw.mjs gateway --allow-unconfigured
