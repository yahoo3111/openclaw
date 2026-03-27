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

# 找 openclaw.mjs 路徑
export HOME=/home/node
cd /home/node

# 嘗試常見路徑
if [ -f /home/node/openclaw.mjs ]; then
  exec /usr/local/bin/node /home/node/openclaw.mjs gateway --allow-unconfigured
elif [ -f /app/openclaw.mjs ]; then
  exec /usr/local/bin/node /app/openclaw.mjs gateway --allow-unconfigured
elif [ -f /usr/src/app/openclaw.mjs ]; then
  exec /usr/local/bin/node /usr/src/app/openclaw.mjs gateway --allow-unconfigured
else
  # 自動搜尋
  OPENCLAW=$(find / -name "openclaw.mjs" -type f 2>/dev/null | head -1)
  if [ -n "$OPENCLAW" ]; then
    exec /usr/local/bin/node "$OPENCLAW" gateway --allow-unconfigured
  else
    echo "Cannot find openclaw.mjs"
    exit 1
  fi
fi
