from django.urls import reverse, reverse_lazy
from django.views.generic.edit import CreateView

from django.http import HttpResponse
from django.views.generic import TemplateView

from .models import TripSchedule, Trip, LocalTrip, InterTownTrip
from .forms import TripScheduleForm, TripForm, LocalTripForm, InterTownTripForm

class TripSchedulingView(TemplateView):
    template_name = 'homepage.html'

class TripScheduleCreateView(CreateView):
    model = TripSchedule
    form_class = TripScheduleForm
    template_name = 'trip_schedule_create.html'

    def get_success_url(self):
        return reverse_lazy('admin:index')

class TripCreateView(CreateView):
    model = Trip
    form_class = TripForm
    template_name = 'trip_create.html'

    def get_success_url(self):
        return reverse_lazy('admin:index')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        if self.request.POST:
            context['inter_town_trip_form'] = InterTownTripForm(self.request.POST)
            context['local_trip_form'] = LocalTripForm(self.request.POST)
        else:
            context['inter_town_trip_form'] = InterTownTripForm()
            context['local_trip_form'] = LocalTripForm()
        return context

    def form_valid(self, form):
        trip = form.save()
        context = self.get_context_data()
        trip_type = form.cleaned_data['trip_type']

        if trip_type == Trip.ITR:  
            inter_town_trip_form = context['inter_town_trip_form']
            if inter_town_trip_form.is_valid():
                inter_town_trip = inter_town_trip_form.save(commit=False)
                inter_town_trip.itr_trip = trip
                inter_town_trip.save()
        elif trip_type == Trip.LTR: 
            local_trip_form = context['local_trip_form']
            if local_trip_form.is_valid():
                local_trip = local_trip_form.save(commit=False)
                local_trip.ltr_trip = trip
                local_trip.save()
        
        return super().form_valid(form)