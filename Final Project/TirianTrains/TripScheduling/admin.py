from django.contrib import admin

from .models import TripSchedule, Trip, InterTownTrip, LocalTrip
# Register your models here.

class TripScheduleAdmin(admin.ModelAdmin):
    model = TripSchedule

class TripAdmin(admin.ModelAdmin):
    model = Trip

class InterTownTripAdmin(admin.ModelAdmin):
    model = InterTownTrip

class LocalTripAdmin(admin.ModelAdmin):
    model = LocalTrip

admin.site.register(TripSchedule, TripScheduleAdmin)
admin.site.register(Trip, TripAdmin)
admin.site.register(InterTownTrip, InterTownTripAdmin)
admin.site.register(LocalTrip, LocalTripAdmin)
