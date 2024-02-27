from django.urls import path
from . import views

urlpatterns = [
    path('register/', views.register, name='register'),
    path('login/', views.loginCheck, name='login'),
    path('home/', views.home, name='home'),

]
