from TripScheduling import views
from django.urls import path

from .views import *

urlpatterns = [
    path('', TripSchedulingView.as_view(), name='homepage'),
    path('tripschedule/create', TripScheduleCreateView.as_view(), name='tripschedule-create'),
    path('tripschedule/queries', views.trip_schedule_queries, name='tripschedule-queries'),
    path('trip/create', TripCreateView.as_view(), name='trip-create'),
    path('trip/queries', views.trip_queries, name='trip-queries'),
    path('tripschedule/<pk>/edit', TripScheduleUpdateView.as_view(), name='tripschedule-update'),
    path('trip/<pk>/edit', TripUpdateView.as_view(), name='trip-update'),
    path('ittrip/<pk>/edit', InterTownTripUpdateView.as_view(), name='ittrip-update'),
]

app_name = "TripScheduling"