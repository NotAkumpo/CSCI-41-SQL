# Generated by Django 5.1.3 on 2024-11-28 14:00

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('TripScheduling', '0002_alter_tripschedule_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tripschedule',
            name='trip_schedule_id',
            field=models.IntegerField(default='00000', max_length=5, primary_key=True, serialize=False, unique=True, validators=[django.core.validators.MinLengthValidator(5)]),
        ),
    ]