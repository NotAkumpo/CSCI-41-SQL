# Generated by Django 5.1.3 on 2024-11-20 14:08

import django.core.validators
import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Trip',
            fields=[
                ('trip_id', models.CharField(default='XXXXX-00000', max_length=11, primary_key=True, serialize=False, unique=True, validators=[django.core.validators.MinLengthValidator(11)])),
                ('origin', models.CharField(default='XXXX', max_length=255)),
                ('destination', models.CharField(default='XXXX', max_length=255)),
                ('departure_time', models.TimeField(default='00:00:00')),
                ('arrival_time', models.TimeField(default='00:00:00')),
                ('train_number', models.IntegerField(default=0)),
                ('trip_type', models.CharField(choices=[('ITR', 'Itr'), ('LTR', 'Ltr'), ('XXX', 'Xxx')], default='XXX', max_length=3, validators=[django.core.validators.MinLengthValidator(3)])),
            ],
        ),
        migrations.CreateModel(
            name='TripSchedule',
            fields=[
                ('trip_schedule_id', models.CharField(default='XXXXX', max_length=5, primary_key=True, serialize=False, unique=True, validators=[django.core.validators.MinLengthValidator(5)])),
                ('date', models.DateField(default='2010-01-01')),
            ],
        ),
        migrations.CreateModel(
            name='InterTownTrip',
            fields=[
                ('itr_trip', models.OneToOneField(default='XXXXX-00000', on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='TripScheduling.trip')),
                ('cost_in_lion_coins', models.IntegerField(default=0)),
                ('duration_time', models.TimeField(default='00:00:00')),
            ],
        ),
        migrations.CreateModel(
            name='LocalTrip',
            fields=[
                ('ltr_trip', models.OneToOneField(default='XXXXX-00000', on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='TripScheduling.trip')),
            ],
        ),
        migrations.AddField(
            model_name='trip',
            name='trip_schedule',
            field=models.ForeignKey(default='XXXXX', on_delete=django.db.models.deletion.CASCADE, related_name='local_trips', to='TripScheduling.tripschedule'),
        ),
    ]
