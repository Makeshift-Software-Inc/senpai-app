part of 'email_bloc.dart';

@immutable
abstract class EmailState {}

class EmailInitial extends EmailState {}

class ContinueButtonEnableChangedState extends EmailState {
  final bool isEnabled;

  ContinueButtonEnableChangedState({
    required this.isEnabled,
  });
}

class ErrorState extends EmailState {
  final String message;

  final bool isEnabled;

  ErrorState({required this.message, required this.isEnabled});
}

class ValidState extends EmailState {}

class LoadingState extends EmailState {}

class EmailSuccessfulState extends EmailState {}
