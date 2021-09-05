#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

echo "Collecting static files"
yes yes | python manage.py collectstatic -c

echo "Performing migrations"
python manage.py migrate

echo "Starting gunicorn"
exec gunicorn "${@}"
