from django.urls import path

from .views import TripSchedulingView, TripScheduleCreateView, TripCreateView

urlpatterns = [
    path('', TripSchedulingView.as_view(), name='homepage'),
    path('tripschedule/create', TripScheduleCreateView.as_view(), name='tripschedule-create'),
    path('trip/create', TripCreateView.as_view(), name='trip-create'),
]

app_name = "TripScheduling"