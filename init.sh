#!/bin/sh
rm -rf /home/node/.openclaw
mkdir -p /home/node/.openclaw

cat > /home/node/.openclaw/openclaw.json << 'CONFIG'
{
  "gateway": {
    "port": 10000,
    "bind": "lan",
    "auth": {
      "token": "6c605435322d4c51abaf56137b420c24973e3005bff54ffee6b254ab3933d7d8"
    },
    "controlUi": {
      "enabled": true,
      "allowInsecureAuth": true,
      "allowedOrigins": ["https://openclaw-render-cdjs.onrender.com"]
    }
  }
}
CONFIG

echo "TOKEN: 6c605435322d4c51abaf56137b420c24973e3005bff54ffee6b254ab3933d7d8"
echo "CONFIG_CONTENT:"
cat /home/node/.openclaw/openclaw.json | grep -A 2 '"auth"'

chown -R node:node /home/node/.openclaw
export HOME=/home/node
cd /home/node
exec /usr/local/bin/node /app/openclaw.mjs gateway --allow-unconfigured
