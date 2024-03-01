from django.urls import path
from . import views


urlpatterns = [
    path('fruits/', views.Fruit, name='fruits'),
    path('vegetables/', views.Vegetable, name='vegetables'),
]
