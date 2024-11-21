from TripScheduling import views
from django.urls import path

from .views import TripSchedulingView, TripScheduleCreateView, TripCreateView

urlpatterns = [
    path('', TripSchedulingView.as_view(), name='homepage'),
    path('tripschedule/create', TripScheduleCreateView.as_view(), name='tripschedule-create'),
    path('tripschedule/queries', views.trip_schedule_queries, name='tripschedule-queries'),
    path('trip/create', TripCreateView.as_view(), name='trip-create'),
    path('trip/queries', views.trip_queries, name='trip-queries'),
]

app_name = "TripScheduling"