# Utiliser une image Python 3.11 slim comme base
FROM python:3.11-slim-bookworm

# Installer les dépendances système et Node.js 22
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    gnupg2 \
    build-essential && \
    curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y --no-install-recommends nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de configuration npm et installer les dépendances Node
COPY package.json package-lock.json ./
RUN npm ci

# Installer les dépendances Python du back‑end
# (On suppose que vos dépendances back sont listées dans backend/requirements.txt)
COPY backend/requirements.txt ./backend/requirements.txt
RUN pip install -r backend/requirements.txt

# Copier l'intégralité du code source (front et back)
COPY . .

# Exposer les ports utilisés par le front-end et le back‑end (à ajuster si nécessaire)
EXPOSE 3000 8080

# Lancer la commande de développement qui démarre à la fois le front-end et le back‑end
CMD [ "npm", "run", "dev" ]
