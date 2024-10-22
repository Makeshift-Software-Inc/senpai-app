import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/l10n/resources.dart';

part 'email_event.dart';
part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  TextEditingController emailController = TextEditingController();

  String email = '';

  EmailBloc() : super(EmailInitial()) {
    on<OnEmailChangedEvent>((event, emit) {
      if (emailController.text.isNotEmpty) {
        emit(ErrorState(message: R.strings.serverError, isEnabled: false));
        emit(ValidState());
      } else {
        emit(ErrorState(message: R.strings.serverError, isEnabled: true));
      }

      email = event.email;
    });

    on<OnEmailInitEvent>((event, emit) {
      if (event.email.isNotEmpty) {
        emit(LoadingState());
        emit(ValidState());
        emailController = TextEditingController(text: event.email);
        email = event.email;
      }
    });

    on<NextTappedEvent>((event, emit) {
      if (email.isNotEmpty) {
        emit(ErrorState(message: R.strings.serverError, isEnabled: false));
        emit(ValidState());
        emit(LoadingState());
        emit(EmailSuccessfulState());
      } else {
        emit(ErrorState(message: R.strings.serverError, isEnabled: true));
      }
    });
  }
}
