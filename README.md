# Projet Docker Compose

## Lancer le serveur

Pour lancer le serveur, exécutez la commande suivante :

```sh
docker-compose up -d
```

Cette commande démarre tous les services définis dans le fichier `docker-compose.yml`.

## URLs des services

Voici les URLs des différents services une fois qu'ils sont démarrés :

- Flowise : [http://localhost:3001](http://localhost:3001)
- Open WebUI : [http://localhost:3000](http://localhost:3000)
- Postgres : [http://localhost:5432](http://localhost:5432)
- Qdrant : [http://localhost:6333](http://localhost:6333)
- AnythingLLM : [http://localhost:6001](http://localhost:6001)
- Autogen Studio : [http://localhost:6080](http://localhost:6080)
- Jupyter Notebook : [http://localhost:6888](http://localhost:6888)
- Pipelines : [http://localhost:9099](http://localhost:9099)
- Langfuse Web : [http://localhost:3003](http://localhost:3003)
- Minio : [http://localhost:9090](http://localhost:9090) (console : [http://localhost:9091](http://localhost:9091))
- Redis : [http://localhost:6379](http://localhost:6379)
- Clickhouse : [http://localhost:8123](http://localhost:8123)

## Problème de connexion de langfuse-worker

Le service `langfuse-worker` perd parfois la connexion et je ne sais pas pourquoi. Si vous rencontrez ce problème, essayez de redémarrer le service avec la commande suivante :

```sh
docker-compose restart langfuse-worker
```

Si le problème persiste, veuillez vérifier les logs du service pour plus de détails :

```sh
docker-compose logs langfuse-worker
```

N'hésitez pas à contribuer ou à ouvrir une issue si vous trouvez une solution à ce problème.