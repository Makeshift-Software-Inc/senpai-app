part of 'new_event_bloc.dart';

@immutable
abstract class NewEventEvent {}

class OnInitNewEvent extends NewEventEvent {
  OnInitNewEvent();
}

class OnChangeEventNameEvent extends NewEventEvent {
  final String eventName;
  OnChangeEventNameEvent(this.eventName);
}

class OnChangeEventDescriptionEvent extends NewEventEvent {
  final String eventDescription;
  OnChangeEventDescriptionEvent(this.eventDescription);
}

class OnChangeEventSizeEvent extends NewEventEvent {
  final String partySize;
  OnChangeEventSizeEvent(this.partySize);
}

class OnChangeEventLocationEvent extends NewEventEvent {
  final String location;
  OnChangeEventLocationEvent(this.location);
}

class OnChangeEventVenueEvent extends NewEventEvent {
  final String venueName;
  OnChangeEventVenueEvent(this.venueName);
}

class OnChangeDateEvent extends NewEventEvent {
  final DateTime eventDate;
  OnChangeDateEvent(this.eventDate);
}

class OnChangeStartTimeEvent extends NewEventEvent {
  final DateTime startTime;
  OnChangeStartTimeEvent(this.startTime);
}

class OnChangeEndTimeEvent extends NewEventEvent {
  final DateTime endTime;
  OnChangeEndTimeEvent(this.endTime);
}

class OnChangeRequiredPaymentEvent extends NewEventEvent {
  final int index;
  OnChangeRequiredPaymentEvent(this.index);
}

class OnChangeCosplayInfoEvent extends NewEventEvent {
  final int index;
  OnChangeCosplayInfoEvent(this.index);
}

class OnChangeConventionEvent extends NewEventEvent {
  final int? id;
  OnChangeConventionEvent(this.id);
}

class OnChangeImageEvent extends NewEventEvent {
  final File image;
  OnChangeImageEvent(this.image);
}

class OnSaveNewEvent extends NewEventEvent {
  OnSaveNewEvent();
}
