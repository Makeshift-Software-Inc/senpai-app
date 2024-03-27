part of 'events_list_filter_bloc.dart';

@immutable
abstract class EventsListFilterEvent {}

class OnInitFilters extends EventsListFilterEvent {
  final EventsListFilterModel initialFilters;
  OnInitFilters({required this.initialFilters});
}

class OnChangeDistance extends EventsListFilterEvent {
  final double distance;
  OnChangeDistance({required this.distance});
}

class OnChangePaidStatus extends EventsListFilterEvent {
  final bool isPaid;
  OnChangePaidStatus({required this.isPaid});
}

class OnChangeFreeStatusEvent extends EventsListFilterEvent {
  final bool isFree;
  OnChangeFreeStatusEvent({required this.isFree});
}

class OnChangeStartDate extends EventsListFilterEvent {
  final DateTime startDate;
  OnChangeStartDate({required this.startDate});
}

class OnChangeEndDate extends EventsListFilterEvent {
  final DateTime endDate;
  OnChangeEndDate({required this.endDate});
}

class OnChangeCosplayStatus extends EventsListFilterEvent {
  final int index;
  OnChangeCosplayStatus(this.index);
}

class OnChangeHostRating extends EventsListFilterEvent {
  final double hostRating;
  OnChangeHostRating(this.hostRating);
}

class OnApplyFilters extends EventsListFilterEvent {
  OnApplyFilters();
}

class OnClearAllFilters extends EventsListFilterEvent {
  OnClearAllFilters();
}
