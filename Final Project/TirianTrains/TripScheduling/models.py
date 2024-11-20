from django.db import models
from django.core.validators import MinLengthValidator

# Create your models here.
class TripSchedule(models.Model):
    trip_schedule_id = models.CharField(
        primary_key=True, 
        unique=True, 
        max_length=5, 
        validators=[MinLengthValidator(5)], 
        null=False, 
        default='XXXXX')
    date = models.DateField(null=False, default='2010-01-01')

class InterTownTrip(models.Model):
    itr_trip_id = models.CharField(
        primary_key=True, 
        unique=True, 
        max_length=11, 
        validators=[MinLengthValidator(11)], 
        null=False,
        default='XXXXX-00000')
    origin = models.CharField(null=False, max_length=255, default='XXXX')
    destination = models.CharField(null=False,  max_length=255, default='XXXX')
    departure_time = models.TimeField(null=False, default='00:00:00')
    arrival_time = models.TimeField(null=False, default='00:00:00')
    train_number = models.IntegerField(null=False, default=00000)
    cost = models.IntegerField(null=False, default=0)
    duration_time = models.TimeField(null=False, default='00:00:00')

    trip_schedule = models.ForeignKey(
        TripSchedule,
        on_delete=models.CASCADE,
        related_name='inter_town_trips',
        default='XXXXX'
    )
    
class LocalTrip(models.Model):
    local_trip_id = models.CharField(
        primary_key=True, 
        unique=True, 
        max_length=11, 
        validators=[MinLengthValidator(11)], 
        null=False,
        default='XXXXX-00000')
    origin = models.CharField(null=False, max_length=255, default='XXXX')
    destination = models.CharField(null=False,  max_length=255, default='XXXX')
    departure_time = models.TimeField(null=False, default='00:00:00')
    arrival_time = models.TimeField(null=False, default='00:00:00')
    train_number = models.IntegerField(null=False, default=00000)
    
    trip_schedule = models.ForeignKey(
        TripSchedule,
        on_delete=models.CASCADE,
        related_name='local_trips',
        default='XXXXX'
    )

