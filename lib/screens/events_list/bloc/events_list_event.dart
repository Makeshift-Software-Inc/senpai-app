part of 'events_list_bloc.dart';

@immutable
abstract class EventsListEvent {}

class OnLoadEventList extends EventsListEvent {
  final int page;

  OnLoadEventList(this.page);
}

class OnLoadConventionsList extends EventsListEvent {
  final int page;

  OnLoadConventionsList(this.page);
}

class OnEventsListLoaded extends EventsListEvent {
  final List<EventModel> eventsList;

  OnEventsListLoaded(this.eventsList);
}

class OnConventionsListLoaded extends EventsListEvent {
  final List<ConventionModel> conventionsList;

  OnConventionsListLoaded(this.conventionsList);
}

class OnYourEventsListLoaded extends EventsListEvent {
  final List<EventModel> eventsList;

  OnYourEventsListLoaded(this.eventsList);
}
