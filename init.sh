#!/bin/sh
# 建立 config
mkdir -p /home/node/.openclaw
cat > /home/node/.openclaw/openclaw.json << 'CONFIG'
{
  "gateway": {
    "port": 8080,
    "bind": "0.0.0.0",
    "controlUi": {
      "enabled": true,
      "allowInsecureAuth": true
    }
  }
}
CONFIG

chown -R node:node /home/node/.openclaw

# 使用絕對路徑
export HOME=/home/node
cd /home/node
exec /usr/local/bin/node /home/node/openclaw.mjs gateway --allow-unconfigured
