part of 'new_event_convention_bloc.dart';

@immutable
abstract class NewEventConventionEvent {}

class OnInitNewEventConvention extends NewEventConventionEvent {
  final List<ConventionModel> conventionsList;
  OnInitNewEventConvention(this.conventionsList);
}

class OnChangeSearchConventionEvent extends NewEventConventionEvent {
  final String searchText;
  OnChangeSearchConventionEvent(this.searchText);
}

class OnSelectConvention extends NewEventConventionEvent {
  final ConventionModel? convention;
  OnSelectConvention(this.convention);
}
