<img src="logo.png" align="right" width="80px" height="80px"/>

# stackcalc-webapp

TODO

## Table of Contents

* **[Installation](#installation)**
  * [uv](#uv)
  * [Pip](#pip)
  * [Docker](#docker)
* [To be done](#TODO)
* [Interesting reads](#read-further)

## Installation

Stackcalc can be installed via uv, pip or docker. To start, clone the repo to your local computer and change into the proper directory.

```
$ git clone git@github.com:stackcalc-project/stackcalc.git
$ cd stackcalc
```

### uv

You can use [uv](https://docs.astral.sh/uv/) to create a dedicated virtual environment.

```
$ uv sync
```

Then run `migrate` to configure the initial database. The command `createsuperuser` will create a new superuser account for accessing the admin. Execute the `runserver` command to start up the local server. Load the site at `http://127.0.0.1:8000` or `http://127.0.0.1:8000/admin`.

```
$ uv run manage.py migrate
$ uv run manage.py createsuperuser
$ uv run manage.py runserver
```

### Pip

To use Pip, create a new virtual environment and then install all packages hosted in `requirements.txt`. Run `migrate` to configure the initial database. and `createsuperuser` to create a new superuser account for accessing the admin. Execute the `runserver` command to start up the local server. Load the site at `http://127.0.0.1:8000` or `http://127.0.0.1:8000/admin`.

```
(.venv) $ pip install -r requirements.txt
(.venv) $ python manage.py migrate
(.venv) $ python manage.py createsuperuser
(.venv) $ python manage.py runserver
```

### Docker

To use Docker with PostgreSQL as the database create a settings file `.env` in the top folder, containing the following fields:

```bash
DJANGO_SECRET_KEY=<GENERATE KEY OF >=50 CHARS>
DJANGO_DEBUG=True
DJANGO_ALLOWED_HOSTS=127.0.0.1
DJANGO_CSRF_TRUSTED_ORIGINS=http://127.0.0.1:8000
DJANGO_SUPERUSER_USERNAME=admin
DJANGO_SUPERUSER_PASSWORD=admin
DJANGO_SUPERUSER_EMAIL=info@stackcalc.com

DATABASE_ENGINE=django.db.backends.postgresql
DATABASE_NAME=stackcalc_webapp
DATABASE_USER=postgres
DATABASE_PASSWORD=admin
DATABASE_HOST=stackcalc-webapp-db
DATABASE_PORT=5432
```

Remove containers from previously started runs.
```
$ docker ps -aq | xargs docker stop | xargs docker rm
```

And then proceed to build the Docker image, run the container and execute the standard commands within Docker.

```
$ docker compose build
$ docker compose up
```

Load the site at `http://127.0.0.1:8000` or `http://127.0.0.1:8000/admin`.

## TODO

- Add general description in the README.
- Update the [EMAIL_BACKEND](https://docs.djangoproject.com/en/4.0/topics/email/#module-django.core.mail) and connect with a mail provider.
- Make the [admin more secure](https://opensource.com/article/18/1/10-tips-making-django-admin-more-secure).

## Read Further

- Django: https://www.djangoproject.com/
- Django courses: https://learndjango.com
- Containerize django: https://betterstack.com/community/guides/scaling-python/dockerize-django/
