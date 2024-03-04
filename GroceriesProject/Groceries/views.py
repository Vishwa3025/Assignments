from django.shortcuts import render
from .models import Fruits, Vegetables

# Create your views here.


def Fruit(request):
    fruitsList = Fruits.objects.all()
    return render(request, 'fruits.html', {'fruitsList': fruitsList})


def Vegetable(request):
    vegetablesList = Vegetables.objects.all()
    return render(request, 'vegetables.html', {'vegetablesList': vegetablesList})
