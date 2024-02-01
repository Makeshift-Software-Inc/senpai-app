part of 'onboarding_bloc.dart';

@immutable
abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class PageChangedState extends OnboardingState {
  final int counter;

  PageChangedState({
    required this.counter,
  });
}

class CheckAppTrackingTransparencyState extends OnboardingState {}

class NextScreenState extends OnboardingState {}

class ShowDialogState extends OnboardingState {}
