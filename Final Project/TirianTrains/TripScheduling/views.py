from django.shortcuts import render
from django.urls import reverse, reverse_lazy
from django.views.generic.edit import CreateView, UpdateView

from django.http import HttpResponse
from django.views.generic import TemplateView

from .models import TripSchedule, Trip, LocalTrip, InterTownTrip
from .forms import *

class TripSchedulingView(TemplateView):
    template_name = 'homepage.html'

class TripScheduleCreateView(CreateView):
    model = TripSchedule
    form_class = TripScheduleForm
    template_name = 'trip_schedule_create.html'

    def get_success_url(self):
        return reverse_lazy('TripScheduling:tripschedule-queries')

class TripCreateView(CreateView):
    model = Trip
    form_class = TripForm
    template_name = 'trip_create.html'

    def get_success_url(self):
        return reverse_lazy('TripScheduling:trip-queries')

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
    
def trip_schedule_queries(request):
    queries = TripSchedule.objects.all()
    form = TripScheduleQueryForm(request.POST or None)

    context = {
        "form": form,
        "queries": queries,
    } 

    if request.method == 'POST' and form.is_valid():
        trip_schedule_id = form.cleaned_data.get('trip_schedule_id')
        date = form.cleaned_data.get('date')

        if trip_schedule_id:
            queries = queries.filter(trip_schedule_id__exact=trip_schedule_id)
        if date:
            queries = queries.filter(date__exact=date)

        context = {
            "form": form,
            "queries": queries
        }

    return render(request, 'trip_schedule_queries.html', context)

def trip_queries(request):
    queries = Trip.objects.select_related('inter_town_trips', 'local_trips').order_by('trip_schedule_id')
    form = TripQueryForm(request.POST or None)

    context = {
        "form": form,
        "queries": queries,
    }

    if request.method == 'POST' and form.is_valid():
        trip_id = form.cleaned_data.get('trip_id')
        trip_schedule_id = form.cleaned_data.get('trip_schedule_id')
        origin = form.cleaned_data.get('origin')
        destination = form.cleaned_data.get('destination')
        departure_time = form.cleaned_data.get('departure_time')
        arrival_time = form.cleaned_data.get('arrival_time')
        train_number = form.cleaned_data.get('train_number')
        trip_type = form.cleaned_data.get('trip_type')
        cost_in_lion_coins = form.cleaned_data.get('cost_in_lion_coins')
        duration_time_in_minutes = form.cleaned_data.get('duration_time_in_minutes')

        if trip_id:
            queries = queries.filter(trip_id__exact=trip_id)
        if trip_schedule_id:
            queries = queries.filter(trip_schedule_id__exact=trip_schedule_id)
        if origin:
            queries = queries.filter(origin__exact=origin)
        if destination:
            queries = queries.filter(destination__exact=destination)
        if departure_time:
            queries = queries.filter(departure_time__exact=departure_time)
        if arrival_time:
            queries = queries.filter(arrival_time__exact=arrival_time)
        if train_number:
            queries = queries.filter(train_number__exact=train_number)
        if trip_type:
            queries = queries.filter(trip_type__exact=trip_type)
        if cost_in_lion_coins:
            queries = queries.filter(inter_town_trips__cost_in_lion_coins__exact=cost_in_lion_coins)
        if duration_time_in_minutes:
            queries = queries.filter(inter_town_trips__duration_time_in_minutes__exact=duration_time_in_minutes)

        context = {
            "form": form,
            "queries": queries
        }

    return render(request, 'trip_queries.html', context)

class TripScheduleUpdateView(UpdateView):
    model = TripSchedule
    form_class = TripScheduleForm
    template_name = 'trip_schedule_update.html'

    def get_success_url(self):
        return reverse_lazy('TripScheduling:tripschedule-queries')
    
class TripUpdateView(UpdateView):
    model = Trip
    form_class = TripForm
    template_name = 'trip_update.html'

    def get_success_url(self):
        return reverse_lazy('TripScheduling:trip-queries')
    
class InterTownTripUpdateView(UpdateView):
    model = InterTownTrip
    form_class = InterTownTripForm
    template_name = 'ittrip_update.html'

    def get_success_url(self):
        return reverse_lazy('TripScheduling:trip-queries')