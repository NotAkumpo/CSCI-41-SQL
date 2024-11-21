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

class TripForm(forms.ModelForm):
    class Meta:
        model = Trip
        fields = '__all__'

class LocalTripForm(forms.ModelForm):
    class Meta:
        model = LocalTrip
        fields = []

class InterTownTripForm(forms.ModelForm):
    class Meta:
        model = InterTownTrip
        fields = ['cost_in_lion_coins', 'duration_time']