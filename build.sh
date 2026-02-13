#!/bin/bash

# Load .env
export $(cat .env | xargs)

# Replace placeholders in index.html
sed -i.bak "s|__JAMENDO_CLIENT_ID__|$JAMENDO_CLIENT_ID|g" src/index.html
sed -i.bak "s|__JAMENDO_API_BASE__|$JAMENDO_API_BASE|g" src/index.html

# Build
npm run tauri build

# Restore original
mv src/index.html.bak src/index.html