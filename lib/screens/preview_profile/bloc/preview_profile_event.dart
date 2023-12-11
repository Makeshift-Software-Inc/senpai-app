part of 'preview_profile_bloc.dart';

@immutable
abstract class PreviewProfileEvent {}

class OnPreviewProfileInitEvent extends PreviewProfileEvent {
  final UserProfileModel user;

  OnPreviewProfileInitEvent({required this.user});
}

class OnFetchDistanceBeetwenUsersEvent extends PreviewProfileEvent {
  final DistanceBetweenUsersModel distance;

  OnFetchDistanceBeetwenUsersEvent({required this.distance});
}
