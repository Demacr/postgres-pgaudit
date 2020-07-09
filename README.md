# Minimal usage
```
  docker run \
    -e IS_AUDIT_LOG_ENABLED=true \
    -e PGAUDIT_LOG=ALL \
    -e POSTGRES_PASSWORD=Secret \
    -d --rm \
    demacr/postgres-pgaudit:10
```
