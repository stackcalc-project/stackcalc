#!/usr/bin/env bash

python manage.py migrate --noinput
python manage.py createsuperuser --noinput
python manage.py collectstatic
python -m gunicorn --bind :8000 --workers 3 project.wsgi:application
