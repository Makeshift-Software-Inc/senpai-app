part of 'settings_profile_bloc.dart';

@immutable
abstract class SettingsProfileEvent {}

class OnSettingsProfileInitEvent extends SettingsProfileEvent {
  final UserProfileModel user;

  OnSettingsProfileInitEvent({required this.user});
}

class OnChangeSettingsStepEvent extends SettingsProfileEvent {
  final SettingsStep step;

  OnChangeSettingsStepEvent({required this.step});
}

class OnChangeActiveStatusEvent extends SettingsProfileEvent {
  final bool isStatusOn;

  OnChangeActiveStatusEvent({required this.isStatusOn});
}

class OnChangeRecentlyActiveStatusEvent extends SettingsProfileEvent {
  final bool isStatusOn;

  OnChangeRecentlyActiveStatusEvent({required this.isStatusOn});
}

class OnChangeDeleteAccointOptionEvent extends SettingsProfileEvent {
  final DeleteAccountOptions option;

  OnChangeDeleteAccointOptionEvent({required this.option});
}

class OnChangePushNotificationOptionsEvent extends SettingsProfileEvent {
  final PushNotificationOptions option;
  final bool isOn;

  OnChangePushNotificationOptionsEvent({
    required this.option,
    required this.isOn,
  });
}

class OnChangeFeedbackTextEvent extends SettingsProfileEvent {
  final String feedback;
  OnChangeFeedbackTextEvent({required this.feedback});
}

class OnChangeFeedbackStartEvent extends SettingsProfileEvent {
  final int index;
  OnChangeFeedbackStartEvent({required this.index});
}
