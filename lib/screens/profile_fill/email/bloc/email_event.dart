part of 'email_bloc.dart';

@immutable
abstract class EmailEvent {}

class OnEmailInitEvent extends EmailEvent {
  final String email;

  OnEmailInitEvent({required this.email});
}

class OnEmailChangedEvent extends EmailEvent {
  final String email;

  OnEmailChangedEvent({required this.email});
}

class NextTappedEvent extends EmailEvent {}
