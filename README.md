# Django Request Counter Docker container

Based on the python:3.7 offical image.

## Usage
Mandatory parameter:
 - DJANGO_SECRET_KEY: new secret for the django server

Optional parameter:
 - DJANGO_ALLOWED_HOSTS: default = 127.0.0.1
 - DEBUG: default = False
 - DATABASE_OPTIONS: default = {}

The image is supposed to connect to an existing mysql database.
Your MySQL DATABASE information should be specified with the following environment variables: (Can be disable with CONFIGURE_MYSQL_CONNECTION=false)
 - DATABASE_HOST : default = 127.0.0.1
 - DATABASE_PORT : default = 3306

Optional if CONFIGURE_MYSQL_CONNECTION is true (default)
 - DATABASE_USERNAME : default = django
 - DATABASE_NAME : default = django
 - DATABASE_ENGINE : default = mysql

Mandatory if CONFIGURE_MYSQL_CONNECTION is true (default)
 - MYSQL_DB_PASSWORD: the existing mysql root password
 - MYSQL_DJANGO_PASSWORD: a new secret for the future "django" user
 - DATABASE_HOST
