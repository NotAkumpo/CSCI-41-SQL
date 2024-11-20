# Generated by Django 5.1.3 on 2024-11-19 14:19

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('TripScheduling', '0007_alter_tripschedule_trip_schedule_id'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tripschedule',
            name='trip_schedule_id',
            field=models.CharField(default='XXXXX', max_length=5, primary_key=True, serialize=False, unique=True, validators=[django.core.validators.MinLengthValidator(5)]),
        ),
    ]
