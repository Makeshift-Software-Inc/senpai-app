part of 'username_bloc.dart';

@immutable
abstract class UsernameState {}

class UsernameInitial extends UsernameState {}

class ContinueButtonEnableChangedState extends UsernameState {
  final bool isEnabled;

  ContinueButtonEnableChangedState({
    required this.isEnabled,
  });
}

class ErrorState extends UsernameState {
  final String message;

  final bool isEnabled;

  ErrorState({required this.message, required this.isEnabled});
}

class ValidState extends UsernameState {}

class LoadingState extends UsernameState {}

class UsernameSuccessfulState extends UsernameState {}
