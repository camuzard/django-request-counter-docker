FROM python:3.7

RUN mkdir -p /opt/djangoapp/src
WORKDIR /opt/djangoapp/src

COPY ./webapp/ /opt/djangoapp/src

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 8000

COPY docker-entrypoint.sh /usr/local/bin