from django import forms

from django.forms.fields import DateField
from .models import TripSchedule, Trip, InterTownTrip, LocalTrip

class TripScheduleForm(forms.ModelForm):
    class Meta:
        model = TripSchedule
        fields = '__all__'
        widgets = {
            'date': forms.DateInput(attrs={'type': 'date'}),
        }

class TripScheduleQueryForm(forms.Form):
    trip_schedule_id = forms.CharField(
        required=False,
        label="Trip Schedule ID",
    )
    date = forms.DateField(
        required=False,
        label="Date",
        widget=forms.DateInput(attrs={'type': 'date'}),
    )

class TripForm(forms.ModelForm):
    class Meta:
        model = Trip
        fields = '__all__'
        widgets = {
            'departure_time': forms.TimeInput(attrs={'type': 'time'}),
            'arrival_time': forms.TimeInput(attrs={'type': 'time'}),
        }

class TripQueryForm(forms.Form):
    trip_id = forms.CharField(
        required=False,
        label="Trip ID",
    )
    trip_schedule_id = forms.CharField(
        required=False,
        label="Trip Schedule ID",
    )
    origin = forms.CharField(
        required=False,
        label="Origin",
    )
    destination = forms.CharField(
        required=False,
        label="Destination",
    )
    departure_time = forms.TimeField(
        required=False,
        label="Departure Time",
        widget=forms.TimeInput(attrs={'type': 'time'}),
    )
    arrival_time = forms.TimeField(
        required=False,
        label="Arrival Time",
        widget=forms.TimeInput(attrs={'type': 'time'}),
    )
    train_number = forms.IntegerField(
        required=False,
        label="Train Number",
    )
    trip_type = forms.ChoiceField(
        required=False,
        label="Trip Type",
        choices=[("", "")] + list(Trip.TRIP_CHOICES.items()),
    )
    cost_in_lion_coins = forms.IntegerField(
        required=False,
        label="Cost in Lion Coins",
    )
    duration_time_in_minutes = forms.IntegerField(
        required=False,
        label="Duration Time",
    )

class LocalTripForm(forms.ModelForm):
    class Meta:
        model = LocalTrip
        fields = []

class InterTownTripForm(forms.ModelForm):
    class Meta:
        model = InterTownTrip
        fields = ['cost_in_lion_coins', 'duration_time_in_minutes']