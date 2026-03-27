#!/bin/sh
# 用 root 權限建立 config
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

# 確保權限正確
chown -R node:node /home/node/.openclaw

# 切換到 node 用戶執行官方命令
exec su -s /bin/sh node -c "node openclaw.mjs gateway --allow-unconfigured"
