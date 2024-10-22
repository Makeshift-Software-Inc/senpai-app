part of 'username_bloc.dart';

@immutable
abstract class UsernameEvent {}

class OnUsernameInitEvent extends UsernameEvent {
  final String username;
  final String? fullName;

  OnUsernameInitEvent({required this.username, this.fullName});
}

class OnUsernameChangedEvent extends UsernameEvent {
  final String? username;
  final String? fullName;

  OnUsernameChangedEvent({this.username, this.fullName});
}

class NextTappedEvent extends UsernameEvent {}
