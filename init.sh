#!/bin/sh
# 建立 config（使用正確的 bind 模式）
mkdir -p /home/node/.openclaw
cat > /home/node/.openclaw/openclaw.json << 'CONFIG'
{
  "gateway": {
    "port": 8080,
    "bind": "lan",
    "controlUi": {
      "enabled": true,
      "allowInsecureAuth": true
    }
  }
}
CONFIG

chown -R node:node /home/node/.openclaw

# 執行（路徑是 /app/openclaw.mjs）
export HOME=/home/node
cd /home/node
exec /usr/local/bin/node /app/openclaw.mjs gateway --allow-unconfigured
