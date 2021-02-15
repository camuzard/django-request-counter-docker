#!/bin/bash

if [[ $CONFIGURE_MYSQL_CONNECTION == "false" ]]; then
	:
else
	apt update
	apt install default-mysql-client -y
	if [[ $(mysql -u root -h django-mysql --password=$MYSQL_DB_PASSWORD -e "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'django'") ]]; then 
		:
	else 
		mysql -u root -h django-mysql --password=$MYSQL_DB_PASSWORD -e "CREATE DATABASE django; 
		USE django; CREATE TABLE request ( id int PRIMARY KEY, number int ); 
		insert into request(id, number) values (1,0); 
		CREATE USER django IDENTIFIED BY '$DATABASE_DJANGO_PASSWORD'; 
		GRANT ALL PRIVILEGES ON django.* TO django;";
	fi
fi

python manage.py migrate

gunicorn --chdir webapp --bind :8000 webapp.wsgi
