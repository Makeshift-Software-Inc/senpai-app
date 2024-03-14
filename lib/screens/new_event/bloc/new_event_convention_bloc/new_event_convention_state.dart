part of 'new_event_convention_bloc.dart';

@immutable
abstract class NewEventConventionState {}

class NewEventConventionInitial extends NewEventConventionState {}

class ErrorNewEventConventionState extends NewEventConventionState {
  final bool isEnable;
  final String message;
  ErrorNewEventConventionState({required this.isEnable, required this.message});
}

class LoadingNewEventConventionState extends NewEventConventionState {}

class ValidState extends NewEventConventionState {}

class SelectConventionSucssesfulState extends NewEventConventionState {}
