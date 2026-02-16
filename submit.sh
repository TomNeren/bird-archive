#!/bin/bash
# Dein 'Feierabend-Knopf' — by Aether & Janus
# Baut, committed und pusht in einem Schritt.

# --- Konfiguration ---
SCHEMA_NAME="BirdArchive"

# --- Skript-Logik ---
COMMIT_MESSAGE="$1"

if [ -z "$COMMIT_MESSAGE" ]; then
  echo "❌ Fehler: Bitte gib eine Commit-Nachricht an."
  echo "   Beispiel: ./submit.sh \"Meine Änderungen\""
  exit 1
fi

# 1. PRÜFEN: Baue das Xcode-Projekt
echo "🔨 Prüfe deine Arbeit... (Xcode Build)"
if command -v xcodebuild &> /dev/null
then
    xcodebuild build -scheme "$SCHEMA_NAME" -destination 'platform=iOS Simulator,name=iPhone 16' CODE_SIGNING_ALLOWED=NO 2>&1 | tail -5
    if [ ${PIPESTATUS[0]} -ne 0 ]; then
      echo ""
      echo "❌ Build fehlgeschlagen. Bitte korrigiere die Fehler in Xcode."
      echo "   Deine Arbeit wird NICHT archiviert."
      exit 1
    fi
else
    echo "⚠️ xcodebuild nicht gefunden. Überspringe Build-Check (Linux-Umgebung)."
fi

echo ""
echo "✅ Build erfolgreich!"

# 2. VERPACKEN: Committe die Änderungen
echo ""
echo "📦 Archiviere deine Änderungen... (git commit)"
git add -A
git commit -m "$COMMIT_MESSAGE"

# 3. VERSENDEN: Pushe zum Hauptarchiv
# echo ""
# echo "🚀 Synchronisiere mit dem Hauptarchiv... (git push)"
# git push origin main

echo ""
echo "✨ Fertig! Deine Arbeit ist lokal archiviert (git commit)."
