part of 'new_event_bloc.dart';

@immutable
abstract class NewEventState {}

class NewEventInitial extends NewEventState {}

class ErrorNewEventState extends NewEventState {
  final bool isEnable;
  ErrorNewEventState({required this.isEnable});
}

class LoadingNewEventState extends NewEventState {}

class ValidState extends NewEventState {}

class ValidEventSucssesfulState extends NewEventState {}
