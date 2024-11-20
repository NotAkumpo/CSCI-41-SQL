from django.urls import path

from .views import TripScheduleView
from .views import TripScheduleCreateView

urlpatterns = [
    path('', TripScheduleView.as_view(), name='homepage'),
    path('tripschedule/create', TripScheduleCreateView.as_view(), name='tripschedule-create'),
]

app_name = "TripScheduling"