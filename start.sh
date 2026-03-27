#!/bin/sh
mkdir -p /tmp/openclaw
cat > /tmp/openclaw/openclaw.json << 'CONFIG'
{
  "gateway": {
    "port": 8080,
    "bind": "lan",
    "controlUi": {
      "dangerouslyAllowHostHeaderOriginFallback": true
    }
  }
}
CONFIG
export OPENCLAW_CONFIG_DIR=/tmp/openclaw
exec node openclaw.mjs gateway --allow-unconfigured
