#!/bin/bash

echo "🔍 Verifying Bird Catalog Assets..."

# Get Bird IDs (those followed by a name line in the next line)
BIRD_IDS="amsel kohlmeise blaumeise rotkehlchen buchfink zaunkoenig singdrossel star haussperling gruenfink"

FAILED=0

for id in $BIRD_IDS; do
  echo -n "Checking $id... "

  # Check sound file
  if [ -f "BirdArchive/Resources/Sounds/$id.mp3" ]; then
    echo -n "🔊 OK "
  else
    echo -n "❌ Missing sound "
    FAILED=1
  fi

  # Check if ID exists in Catalog
  if grep -q "id: \"$id\"" BirdArchive/Data/BirdCatalog.swift; then
    echo -n "📖 Catalog OK "
  else
    echo -n "❌ Missing in Catalog "
    FAILED=1
  fi

  echo ""
done

if [ $FAILED -eq 0 ]; then
  echo "✅ All assets verified successfully!"
  exit 0
else
  echo "❌ Asset verification failed!"
  exit 1
fi
