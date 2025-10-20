# Script PowerShell de démarrage (Windows)
Param()

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $scriptDir

if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
  Write-Error "Node.js introuvable. Installe Node.js (version recommandée 16+)."
  exit 1
}

if (-not (Test-Path node_modules)) {
  Write-Output "Installation des dépendances..."
  npm install
}

Write-Output "Démarrage du bot..."
# Essaye npm start, sinon node Ovl.js
try {
  npm start
} catch {
  node Ovl.js
}