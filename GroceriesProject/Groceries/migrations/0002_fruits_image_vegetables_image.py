# Generated by Django 5.0.1 on 2024-02-29 02:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Groceries', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='fruits',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='static/vegetable_images/'),
        ),
        migrations.AddField(
            model_name='vegetables',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='static/fruit_images/'),
        ),
    ]
