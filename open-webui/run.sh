#!/bin/bash

# === Configuration ===
image_name="open-webui"
container_name="open-webui"
host_port=3000
container_port=8080

# Adresse IP à injecter (modifiable si besoin)
AWELS_IP="192.168.1.10"
config_file="runtime-config.js"

# === Création du fichier runtime-config.js ===
echo "window.runtimeconfig = { AWELS_HOST: '${AWELS_IP}' };" > "$config_file"

# Vérification de la présence du fichier
if [ ! -f "$config_file" ]; then
  echo "❌ Erreur : runtime-config.js introuvable."
  exit 1
fi

# === Docker ===
# Construction de l'image
docker build -t "$image_name" .

# Arrêt et suppression de l'ancien conteneur si présent
docker stop "$container_name" &>/dev/null || true
docker rm "$container_name" &>/dev/null || true

# Lancement du nouveau conteneur
docker run -d -p "$host_port":"$container_port" \
    --add-host=host.docker.internal:host-gateway \
    -v "${image_name}:/app/backend/data" \
    -v "$(pwd)/$config_file:/app/static/runtime-config.js" \
    --name "$container_name" \
    --restart always \
    "$image_name"

# Nettoyage des images obsolètes
docker image prune -f
