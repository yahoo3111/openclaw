#!/bin/sh
mkdir -p /home/node/.openclaw
cat > /home/node/.openclaw/openclaw.json << 'CONFIG'
{
  "gateway": {
    "port": 8080,
    "bind": "lan",
    "auth": {
      "mode": "token"
    }
  }
}
CONFIG
exec node openclaw.mjs gateway --allow-unconfigured
