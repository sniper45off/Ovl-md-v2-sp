# Ovl-md-v2-sp — Guide d'installation et d'utilisation (FR)

Ce document explique rapidement comment cloner, installer et lancer le bot WhatsApp, scanner le QR, récupérer la session et l'utiliser sur un hébergement (Render, Railway, VPS...).

## 1) Principe (rapide)
1. Sur ton PC : clone le dépôt et installe les dépendances.
2. Lance le bot (npm start ou node Ovl.js).
3. Le bot affiche un QR dans le terminal (ou une URL vers un QR).
4. Ouvre WhatsApp sur ton téléphone → Appareils liés → Lier un appareil → scanne le QR.
5. Le projet crée un fichier de session (par ex. `auth_info_multi.json`, `session.json` ou `state.json`) — garde-le secret.

## 2) Commandes prêtes à coller

Linux / macOS
```bash
# installer git/node si nécessaire (exemple Debian/Ubuntu)
# sudo apt update && sudo apt install -y git nodejs npm

# cloner ton repo
git clone https://github.com/sniper45off/Ovl-md-v2-sp.git
cd Ovl-md-v2-sp

# installer dépendances
npm install

# lancer
npm.start
# si npm start n'existe pas, essaie :
# node Ovl.js
```

Windows (PowerShell)
```powershell
# installer git/node si tu ne les as pas (installer depuis les sites officiels)

# cloner
git clone https://github.com/sniper45off/Ovl-md-v2-sp.git
cd Ovl-md-v2-sp

# installer
npm install

# lancer
npm start
# ou
# node Ovl.js
```

## 3) Scan du QR
- Ouvre WhatsApp sur TON téléphone (même SIM). Menu → Appareils liés → Lier un appareil → scanne le QR affiché dans le terminal.
- Si le terminal n’affiche pas un QR lisible, il peut afficher une URL (ex: `http://localhost:xxxx/qr`) — ouvre-la dans ton navigateur pour agrandir le QR, puis scanne.
- Si tu ne peux pas scanner depuis le même téléphone, utilise un second téléphone.

## 4) Où est la session et comment la récupérer
Après connexion, dans le dossier du projet tu verras souvent :
- `auth_info_multi.json`
- `session.json`
- `state.json`

Vérifie :
```bash
ls -la
cat auth_info_multi.json
```
Ne montre jamais le contenu à des tiers — c’est l’équivalent d’un mot de passe.

## 5) Utiliser cette session sur ton hébergement
Deux options :

A) Uploader le fichier de session dans ton hébergement
- Place `auth_info_multi.json` (ou équivalent) dans le dossier du projet déployé (ou uploade via l’interface de Render/Railway).
- Veille à ce que le fichier ne soit pas public.

B) Utiliser une variable d'environnement (SESSION_JSON ou SESSION_ID)
- Certains projets acceptent la session encodée dans une variable d'environnement.
- Copie le JSON de session (en une seule ligne si nécessaire) et colle-le dans la variable d'environnement sécurisée de ta plateforme.
- Ne commit jamais le JSON dans un repo public.

## 6) Astuces & problèmes courants
- Si le terminal n’affiche rien : vérifie `package.json` pour connaître le script "start".
- Si `npm install` échoue : assure-toi que Node.js (recommandé 16+) est installé.
- Si WhatsApp refuse de scanner : redémarre l’app, vide le cache, ou teste avec un autre appareil.
- Pour éviter le rescan : ne supprime pas le fichier de session et configure le bot pour l’utiliser automatiquement (vérifie le README du repo).

## 7) Sécurité & bonnes pratiques
- Ne publie jamais le fichier de session ni la SESSION_ID.
- Si tu dois déployer publiquement : rends ton repo privé ou stocke la session dans les secrets/env vars du service.
- Restreins les permissions d’accès au dossier contenant la session.

---