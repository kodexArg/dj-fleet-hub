#!/bin/sh

echo "Esperando a PostgreSQL..."
while ! nc -z $POSTGRES_HOST 5432; do
  sleep 1
done
echo "PostgreSQL está listo."

echo "Aplicando migraciones..."
python manage.py migrate

echo "Recopilando archivos estáticos..."
python manage.py collectstatic --noinput

exec "$@"  # Pasa el comando final desde docker-compose.yml
