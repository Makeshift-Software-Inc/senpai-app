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

class OnInitHostModelDetails extends EventDetailsEvent {
  final UserProfileModel hostModel;
  OnInitHostModelDetails(this.hostModel);
}

class OnFetchJoinRequest extends EventDetailsEvent {
  final List<JoinRequestModel> requestsList;
  OnFetchJoinRequest(this.requestsList);
}

class OnSaveJoinRequestId extends EventDetailsEvent {
  final String joinRequestId;
  OnSaveJoinRequestId(this.joinRequestId);
}
