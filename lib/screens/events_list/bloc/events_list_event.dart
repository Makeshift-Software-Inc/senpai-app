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

class OnLoadYourEventsList extends EventsListEvent {
  final int page;

  OnLoadYourEventsList(this.page);
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
  final bool? verified;
  final String? userId;
  OnYourEventsListLoaded(this.eventsList, {this.userId, this.verified});
}

class OnApplyProfileFilters extends EventsListEvent {
  final EventsListFilterModel filters;
  OnApplyProfileFilters({required this.filters});
}

class OnRefreshYourEventsList extends EventsListEvent {
  OnRefreshYourEventsList();
}
