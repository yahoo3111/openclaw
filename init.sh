#!/bin/sh
rm -rf /home/node/.openclaw
mkdir -p /home/node/.openclaw

# 创建包含固定 token 的配置
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
      "allowedOrigins": ["https://openclaw-render-cdjs.onrender.com"]
    }
  }
}
CONFIG

echo "TOKEN_SET_IN_CONFIG: 6c605435322d4c51abaf56137b420c24973e3005bff54ffee6b254ab3933d7d8"

chown -R node:node /home/node/.openclaw
export HOME=/home/node
cd /home/node

# 设置环境变量，确保 OpenClaw 读取
export OPENCLAW_GATEWAY_TOKEN="6c605435322d4c51abaf56137b420c24973e3005bff54ffee6b254ab3933d7d8"
exec /usr/local/bin/node /app/openclaw.mjs gateway --allow-unconfigured
