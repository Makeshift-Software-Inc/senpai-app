part of 'events_list_filter_bloc.dart';

@immutable
abstract class EventsListFilterState {}

class EventsListFilterInitial extends EventsListFilterState {}

class ErrorEventsListFilterState extends EventsListFilterState {
  final bool isEnable;
  final String message;
  ErrorEventsListFilterState({required this.isEnable, required this.message});
}

class LoadingFiltersState extends EventsListFilterState {}

class FetchSucssesfulState extends EventsListFilterState {}

class ValidState extends EventsListFilterState {}

class ValidSaveState extends EventsListFilterState {}

class ClearAllFiltersState extends EventsListFilterState {}
