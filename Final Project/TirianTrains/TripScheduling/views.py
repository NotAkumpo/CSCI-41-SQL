from django.urls import reverse, reverse_lazy
from django.views.generic.edit import CreateView

from django.http import HttpResponse
from django.views.generic import TemplateView

from .models import TripSchedule
from .forms import TripScheduleForm

class TripScheduleView(TemplateView):
    template_name = 'homepage.html'

class TripScheduleCreateView(CreateView):
    model = TripSchedule
    form_class = TripScheduleForm
    template_name = 'trip_schedule_create.html'

    def get_success_url(self):
        return reverse_lazy('admin:index')