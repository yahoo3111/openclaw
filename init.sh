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
      "allowedOrigins": ["https://openclaw-render-cdjs.onrender.com"]
    }
  }
}
CONFIG

chown -R node:node /home/node/.openclaw
export HOME=/home/node
cd /home/node

# 启动 OpenClaw
/usr/local/bin/node /app/openclaw.mjs gateway --allow-unconfigured &

# 等待几秒让 OpenClaw 生成 token
sleep 5

# 显示生成的 token
echo "=== GATEWAY TOKEN ==="
cat /home/node/.openclaw/openclaw.json | grep -o '"token":"[^"]*"' || echo "Token not found in config"
echo "===================="

# 保持运行
wait
