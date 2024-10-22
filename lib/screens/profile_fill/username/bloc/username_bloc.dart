import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/l10n/resources.dart';

part 'username_event.dart';
part 'username_state.dart';

class UsernameBloc extends Bloc<UsernameEvent, UsernameState> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  String username = '';
  String fullName = '';

  UsernameBloc() : super(UsernameInitial()) {
    on<OnUsernameChangedEvent>((event, emit) {
      if (usernameController.text.isNotEmpty) {
        emit(ErrorState(message: R.strings.serverError, isEnabled: false));
        emit(ValidState());
      } else {
        emit(ErrorState(message: R.strings.serverError, isEnabled: true));
      }

      if (event.username != null) {
        username = event.username ?? "";
      }
      fullName = event.fullName ?? "";
    });

    on<OnUsernameInitEvent>((event, emit) {
      if (event.username.isNotEmpty) {
        emit(LoadingState());
        emit(ValidState());
        usernameController = TextEditingController(text: event.username);
        fullNameController = TextEditingController(text: event.fullName);
        username = event.username;
        fullName = event.fullName ?? "";
      }
    });

    on<NextTappedEvent>((event, emit) {
      if (username.isNotEmpty) {
        emit(ErrorState(message: R.strings.serverError, isEnabled: false));
        emit(ValidState());
        emit(LoadingState());
        emit(UsernameSuccessfulState());
      } else {
        emit(ErrorState(message: R.strings.serverError, isEnabled: true));
      }
    });
  }
}
