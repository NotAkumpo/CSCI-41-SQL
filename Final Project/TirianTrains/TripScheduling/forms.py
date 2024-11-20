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