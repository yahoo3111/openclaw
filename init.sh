#!/bin/sh
rm -rf /home/node/.openclaw

mkdir -p /home/node/.openclaw

# 使用环境变量中的 TOKEN，如果没有则生成一个
if [ -z "$OPENCLAW_GATEWAY_TOKEN" ]; then
  TOKEN=$(openssl rand -hex 32)
  echo "WARNING: OPENCLAW_GATEWAY_TOKEN not set, generated: $TOKEN"
else
  TOKEN=$OPENCLAW_GATEWAY_TOKEN
  echo "Using OPENCLAW_GATEWAY_TOKEN from environment: ${TOKEN:0:16}..."
fi

cat > /home/node/.openclaw/openclaw.json << CONFIG
{
  "gateway": {
    "port": 10000,
    "bind": "lan",
    "auth": {
      "token": "$TOKEN"
    },
    "controlUi": {
      "enabled": true,
      "allowedOrigins": ["https://openclaw-render-cdjs.onrender.com"]
    }
  }
}
CONFIG

echo "=== TOKEN FOR DASHBOARD ==="
echo "$TOKEN"
echo "==========================="

chown -R node:node /home/node/.openclaw
export HOME=/home/node
cd /home/node
exec /usr/local/bin/node /app/openclaw.mjs gateway --allow-unconfigured
