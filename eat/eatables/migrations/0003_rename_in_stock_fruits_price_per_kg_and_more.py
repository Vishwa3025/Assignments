# Generated by Django 5.0.2 on 2024-02-28 16:19

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('eatables', '0002_rename_vegetable_vegetables'),
    ]

    operations = [
        migrations.RenameField(
            model_name='fruits',
            old_name='In_Stock',
            new_name='Price_per_Kg',
        ),
        migrations.RenameField(
            model_name='fruits',
            old_name='Price',
            new_name='Stock_in_Kg',
        ),
        migrations.RenameField(
            model_name='vegetables',
            old_name='In_Stock',
            new_name='Price_per_Kg',
        ),
        migrations.RenameField(
            model_name='vegetables',
            old_name='Price',
            new_name='Stock_in_Kg',
        ),
    ]
