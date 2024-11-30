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
    date = models.DateField(null=False, unique=True, default='2010-01-01')

    def __str__(self):
           return self.trip_schedule_id

class Trip(models.Model):
    trip_id = models.CharField(
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

    ITR = "ITR"
    LTR = "LTR"
    XXX = "XXX"
    TRIP_CHOICES = {
        ITR: "ITR",
        LTR: "LTR",
        XXX: "XXX"
    }

    trip_type = models.CharField(
        null=False, 
        max_length=3,
        validators=[MinLengthValidator(3)], 
        default=XXX,
        choices=TRIP_CHOICES)
    
    trip_schedule = models.ForeignKey(
        'TripSchedule',
        on_delete=models.CASCADE,
        related_name='trips',
        default='XXXXX',
        related_query_name='tripss'
    )

    route = models.ForeignKey(
        'Route',
        on_delete=models.CASCADE,
        related_name='trips',
        default='XXXX',
        related_query_name='tripss'
    )

    def __str__(self):
           return self.trip_id
    
    class Meta:
        verbose_name = 'Trip'
        verbose_name_plural = 'Trips'

class InterTownTrip(models.Model):
    itr_trip = models.OneToOneField('Trip', on_delete=models.CASCADE, primary_key=True, default='XXXXX-00000', related_name='inter_town_trips')
    cost_in_lion_coins = models.IntegerField(null=False, default=0)
    duration_time_in_minutes = models.IntegerField(null=False, default=0)

    def __str__(self):
           return self.itr_trip.trip_id
    
class LocalTrip(models.Model):
    ltr_trip = models.OneToOneField('Trip', on_delete=models.CASCADE, primary_key=True, default='XXXXX-00000', related_name='local_trips')

    def __str__(self):
           return self.ltr_trip.trip_id

class Route(models.Model):
    route_id = models.CharField(
        primary_key=True, 
        unique=True, 
        max_length=8, 
        validators=[MinLengthValidator(8)], 
        null=False,
        default='XXXX-000')
    
    IR = "IR"
    LR = "LR"
    XX = "XX"
    ROUTE_CHOICES = {
        IR: "IR",
        LR: "LR",
        XX: "XX"
    }

    route_type = models.CharField(
        null=False, 
        max_length=2,
        validators=[MinLengthValidator(2)], 
        default=XX,
        choices=ROUTE_CHOICES)
    expected_duration = models.TimeField(null=False, default='00:00:00')
    starting_station = models.CharField(null=False,  max_length=255, default='XXXX')
    ending_station = models.CharField(null=False,  max_length=255, default='XXXX')
    number_of_trips = models.IntegerField(null=False, default=0)

    def __str__(self):
           return self.route_id