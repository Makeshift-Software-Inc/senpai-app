part of 'event_details_bloc.dart';

@immutable
abstract class EventDetailsState {}

class EventDetailsInitial extends EventDetailsState {}

class ErrorEventDetailsState extends EventDetailsState {
  final bool isEnable;
  final String message;
  ErrorEventDetailsState({required this.isEnable, required this.message});
}

class LoadingEventDetailsState extends EventDetailsState {}

class ValidState extends EventDetailsState {}

class SelectConventionSucssesfulState extends EventDetailsState {}
