#!/bin/bash

# Générer le fichier de config.js avec les variables d'environnement
/app/generate-config.sh

# Lancer ton app backend (adapter selon ton app !)
node build/index.js
