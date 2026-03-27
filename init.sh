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

# 改權限
chown -R node:node /home/node/.openclaw

# 直接用 gosu 或 setpriv 切換用戶（不需要密碼）
# 如果沒有，就用官方原來的方式啟動，但指定用戶
exec setpriv --reuid=node --regid=node --init-groups node openclaw.mjs gateway --allow-unconfigured 2>/dev/null || \
exec runuser -u node -- node openclaw.mjs gateway --allow-unconfigured 2>/dev/null || \
exec su -s /bin/sh node -c "node openclaw.mjs gateway --allow-unconfigured"
