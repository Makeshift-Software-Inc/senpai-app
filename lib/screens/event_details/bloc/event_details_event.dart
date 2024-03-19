part of 'event_details_bloc.dart';

@immutable
abstract class EventDetailsEvent {}

class OnInitEventDetails extends EventDetailsEvent {
  final String eventId;
  final EventDetailsModel eventModel;
  OnInitEventDetails(this.eventModel, this.eventId);
}

class OnInitConventionDetails extends EventDetailsEvent {
  final ConventionModel conventionModel;
  OnInitConventionDetails(this.conventionModel);
}
