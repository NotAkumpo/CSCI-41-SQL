# Generated by Django 5.0.2 on 2024-11-21 06:13

import django.core.validators
import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('TripScheduling', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='trip',
            options={'verbose_name': 'Trip', 'verbose_name_plural': 'Trips'},
        ),
        migrations.AlterField(
            model_name='intertowntrip',
            name='itr_trip',
            field=models.OneToOneField(default='XXXXX-00000', on_delete=django.db.models.deletion.CASCADE, primary_key=True, related_name='inter_town_trips', serialize=False, to='TripScheduling.trip'),
        ),
        migrations.AlterField(
            model_name='localtrip',
            name='ltr_trip',
            field=models.OneToOneField(default='XXXXX-00000', on_delete=django.db.models.deletion.CASCADE, primary_key=True, related_name='local_trips', serialize=False, to='TripScheduling.trip'),
        ),
        migrations.AlterField(
            model_name='trip',
            name='train_number',
            field=models.IntegerField(default=0, max_length=5, validators=[django.core.validators.MinLengthValidator(5)]),
        ),
        migrations.AlterField(
            model_name='trip',
            name='trip_schedule',
            field=models.ForeignKey(default='XXXXX', on_delete=django.db.models.deletion.CASCADE, related_name='local_trips', related_query_name='trips', to='TripScheduling.tripschedule'),
        ),
    ]
