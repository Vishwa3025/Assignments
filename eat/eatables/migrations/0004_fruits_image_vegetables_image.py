# Generated by Django 5.0.2 on 2024-02-28 17:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('eatables', '0003_rename_in_stock_fruits_price_per_kg_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='fruits',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='vegetable_images/'),
        ),
        migrations.AddField(
            model_name='vegetables',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='fruit_images/'),
        ),
    ]
