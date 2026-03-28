#!/bin/sh
rm -rf /home/node/.openclaw

mkdir -p /home/node/.openclaw

TOKEN="${OPENCLAW_GATEWAY_TOKEN:-$(openssl rand -hex 32)}"

cat > /home/node/.openclaw/openclaw.json << EOF
{
  "gateway": {
    "port": 10000,
    "bind": "lan",
    "auth": {
      "token": "a3a8caa07e113a0eb2e9813d9f148e79964173c0c5e5a332ec4797533189694e"
    },
    "controlUi": {
      "enabled": true,
      "allowedOrigins": ["https://openclaw-render-cdjs.onrender.com"]
    }
  }
}
EOF

echo "TOKEN_FOR_DASHBOARD: $TOKEN"

chown -R node:node /home/node/.openclaw
export HOME=/home/node
cd /home/node
exec /usr/local/bin/node /app/openclaw.mjs gateway --allow-unconfigured
