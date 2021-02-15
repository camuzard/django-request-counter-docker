from django.shortcuts import render
from django.http import HttpResponse
from django.db import models
from django.db import connection
import socket

def get_nb_request():
    cursor = connection.cursor()
    cursor.execute("select number from request where id=1;")
    row = cursor.fetchone()
    return row

def update_nb_request():
    cursor = connection.cursor()
    cursor.execute("update request set number = number + 1 where id=1;")

def index(request):
    hostname = socket.gethostname()
    update_nb_request()
    request_number = get_nb_request()
    return render(request, 'index.html', {'request_number': request_number[0], 'hostname': hostname})