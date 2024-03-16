part of 'events_list_bloc.dart';

@immutable
abstract class EventsListState {}

class LoadingEventsListState extends EventsListState {}

class LoadedEventsListState extends EventsListState {
  final List<EventModel> eventsList;

  LoadedEventsListState(this.eventsList);
}

class LoadingConventionsListState extends EventsListState {}

class LoadedConventionsListState extends EventsListState {
  final List<ConventionModel> conventionsList;

  LoadedConventionsListState(this.conventionsList);
}

class LoadedYourEventsListState extends EventsListState {
  final List<EventModel> eventsList;

  LoadedYourEventsListState(this.eventsList);
}

class EmptyConventionsListState extends EventsListState {}

class EmptyEventsListState extends EventsListState {}

class ErrorEventsListState extends EventsListState {}

class LoadedListState extends EventsListState {}
