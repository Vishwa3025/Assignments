# Generated by Django 5.0.1 on 2024-02-29 02:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Groceries', '0003_alter_fruits_image_alter_vegetables_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fruits',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='Groceries/static/vegetable_images/'),
        ),
        migrations.AlterField(
            model_name='vegetables',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='Groceries/static/vegetable_images/'),
        ),
    ]
