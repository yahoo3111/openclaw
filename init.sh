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
      "allowInsecureAuth": true,
      "allowedOrigins": ["*"]
    }
  },
  "llm": {
    "provider": "openrouter",
    "model": "anthropic/claude-opus-4"
  }
}
CONFIG

# 從環境變數取得 API Key
if [ -n "$OPENROUTER_API_KEY" ]; then
  echo "OPENROUTER_API_KEY is set"
else
  echo "WARNING: OPENROUTER_API_KEY not set"
fi

chown -R node:node /home/node/.openclaw
export HOME=/home/node
cd /home/node
exec /usr/local/bin/node /app/openclaw.mjs gateway --allow-unconfigured
