FROM node:20-alpine

# Dépendances nécessaires
RUN apk add --update libc6-compat python3 make g++ \
 && apk add --no-cache build-base cairo-dev pango-dev chromium git

# Installer PNPM globalement
RUN npm install -g pnpm

# Config Puppeteer pour Chromium
ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Augmenter la mémoire pour Node.js
ENV NODE_OPTIONS=--max-old-space-size=8192

WORKDIR /usr/src

# Copier tout le code source
COPY . .

# Créer tous les fichiers placeholder nécessaires
RUN mkdir -p /usr/src/packages/ui/src/views/credentials && \
    echo "// Placeholder file for import\nexport default {}" > /usr/src/packages/ui/src/views/credentials/index.js && \
    echo "// Placeholder file\nexport default function AddEditCredentialDialog() { return null; }" > /usr/src/packages/ui/src/views/credentials/AddEditCredentialDialog.jsx && \
    echo "// Placeholder file\nexport default function CredentialListDialog() { return null; }" > /usr/src/packages/ui/src/views/credentials/CredentialListDialog.jsx && \
    echo "// Extra placeholders to prevent further errors\nconst allCredentialComponents = {AddEditCredentialDialog: () => null, CredentialListDialog: () => null};\nexport default allCredentialComponents;\nexport const getCredentialTypes = () => [];\nexport const getCredential = () => ({});" >> /usr/src/packages/ui/src/views/credentials/index.js

# Installer toutes les dépendances
RUN pnpm install

# Builder manuellement le UI (débogable)
RUN pnpm --filter flowise-ui... build

# Exposer le port par défaut
EXPOSE 3000

# Lancer l'app
CMD [ "pnpm", "start" ]