from django.db import models

# Create your models here.


class Vegetables(models.Model):
    Name = models.CharField(max_length=15)
    Price_per_Kg = models.IntegerField()
    Stock_in_Kg = models.IntegerField()
    image = models.ImageField(upload_to='vegetable_images/', null=True, blank=True)


class Fruits(models.Model):
    Name = models.CharField(max_length=15)
    Price_per_Kg = models.IntegerField()
    Stock_in_Kg = models.IntegerField()
    image = models.ImageField(upload_to='fruit_images/', null=True, blank=True)
