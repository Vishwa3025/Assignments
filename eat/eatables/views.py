from django.shortcuts import render
from .models import Fruits, Vegetables

# Create your views here.


def Fruit(request):
    fruitsList = Fruits.objects.all().values()
    return render(request, 'fruits.html', {'fruitsList': fruitsList})


def Vegetable(request):
    vegetablesList = Vegetables.objects.all().values()
    return render(request, 'vegetables.html', {'vegetablesList': vegetablesList})
