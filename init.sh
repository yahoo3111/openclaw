#!/bin/sh
rm -rf /home/node/.openclaw
mkdir -p /home/node/.openclaw

cat > /home/node/.openclaw/openclaw.json << 'CONFIG'
{
  "gateway": {
    "port": 10000,
    "bind": "lan",
    "controlUi": {
      "enabled": true,
      "allowInsecureAuth": true,
      "allowedOrigins": ["*"]
    }
  }
}
CONFIG

echo "OPENROUTER_API_KEY is set: ${OPENROUTER_API_KEY:0:20}..."

chown -R node:node /home/node/.openclaw
export HOME=/home/node
cd /home/node
exec /usr/local/bin/node /app/openclaw.mjs gateway --allow-unconfigured
