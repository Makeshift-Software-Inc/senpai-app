import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:http/http.dart';
import 'package:senpai/dependency_injection/injection.dart';
import 'package:senpai/models/auth/auth_model.dart';
import 'package:senpai/models/events/new_event/new_event_model.dart';
import 'package:senpai/screens/new_event/enums/new_event_enums.dart';
import 'package:senpai/utils/methods/utils.dart';

part 'new_event_event.dart';
part 'new_event_state.dart';

class NewEventBloc extends Bloc<NewEventEvent, NewEventState> {
  NewEventModel newEvent = NewEventModel.initial();
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController eventSizeController = TextEditingController();
  TextEditingController eventVenueController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  MultipartFile? eventImage;
  File? image;

  DateTime dateEvent = DateTime.now();
  DateTime minDateEvent = DateTime.now();
  DateTime maxDateEvent = DateTime.now();

  DateTime startTimeEvent = DateTime.now();
  DateTime endTimeEvent = DateTime.now();

  int? paymentRequiredIndex;
  int? cosplayStatusIndex;

  NewEventBloc() : super(NewEventInitial()) {
    on<OnInitNewEvent>((event, emit) async {
      final storage = getIt<TokenStorage<AuthModel>>();
      await storage.read().then((data) {
        if (data != null) {
          newEvent = newEvent.copyWith(
            userId: data.user.id,
            startDate: startTimeEvent,
          );
        }
      });
      eventSizeController = TextEditingController(
        text: newEvent.memberLimit.toString(),
      );
      emit(NewEventInitial());
    });

    on<OnChangeEventNameEvent>((event, emit) {
      emit(LoadingNewEventState());
      if (event.eventName.isNotEmpty) {
        newEvent = newEvent.copyWith(title: event.eventName);
        emit(ValidState());
      } else {
        emit(
          ErrorNewEventState(
            isEnable: false,
          ),
        );
      }
    });

    on<OnChangeEventDescriptionEvent>((event, emit) {
      emit(LoadingNewEventState());
      if (event.eventDescription.isNotEmpty) {
        newEvent = newEvent.copyWith(description: event.eventDescription);
        emit(ValidState());
      } else {
        emit(
          ErrorNewEventState(
            isEnable: false,
          ),
        );
      }
    });

    on<OnChangeEventSizeEvent>((event, emit) {
      emit(LoadingNewEventState());

      final isValidPartySize = isValidMaxPartySize(event.partySize);
      if (event.partySize.isNotEmpty && isValidPartySize) {
        final memberLimit = int.parse(event.partySize);
        newEvent = newEvent.copyWith(memberLimit: memberLimit);
        emit(ValidState());
      } else {
        emit(
          ErrorNewEventState(
            isEnable: false,
          ),
        );
      }
    });

    on<OnChangeEventLocationEvent>((event, emit) {
      emit(LoadingNewEventState());
      if (event.location.isNotEmpty) {
        newEvent = newEvent.copyWith(fullAddress: event.location);
        emit(ValidState());
      } else {
        emit(
          ErrorNewEventState(
            isEnable: false,
          ),
        );
      }
    });

    on<OnChangeEventVenueEvent>((event, emit) {
      emit(LoadingNewEventState());
      if (event.venueName.isNotEmpty) {
        newEvent = newEvent.copyWith(venue: event.venueName);
        emit(ValidState());
      } else {
        emit(
          ErrorNewEventState(
            isEnable: false,
          ),
        );
      }
    });

    on<OnChangeDateEvent>((event, emit) {
      emit(LoadingNewEventState());
      startTimeEvent = startTimeEvent.copyWith(
        year: event.eventDate.year,
        month: event.eventDate.month,
        day: event.eventDate.day,
      );

      endTimeEvent = endTimeEvent.copyWith(
        year: event.eventDate.year,
        month: event.eventDate.month,
        day: event.eventDate.day,
      );

      newEvent = newEvent.copyWith(startDate: startTimeEvent);
      emit(ValidState());
    });

    on<OnChangeStartTimeEvent>((event, emit) {
      startTimeEvent = startTimeEvent.copyWith(
        hour: event.startTime.hour,
        minute: event.startTime.minute,
      );
      newEvent = newEvent.copyWith(startDate: startTimeEvent);
      emit(ValidState());
    });

    on<OnChangeEndTimeEvent>((event, emit) {
      endTimeEvent = startTimeEvent.copyWith(
        hour: event.endTime.hour,
        minute: event.endTime.minute,
      );
      newEvent = newEvent.copyWith(endDate: endTimeEvent);
      emit(ValidState());
    });

    on<OnChangeRequiredPaymentEvent>((event, emit) {
      paymentRequiredIndex = event.index;
      newEvent = newEvent.copyWith(paymentRequired: event.index == 0);
      emit(ValidState());
    });

    on<OnChangeCosplayInfoEvent>((event, emit) {
      cosplayStatusIndex = event.index;
      newEvent = newEvent.copyWith(
        cosplayRequired: cosplayToServer(CosplayStatus.values[event.index]),
      );
      emit(ValidState());
    });
    on<OnChangeConventionEvent>((event, emit) {
      newEvent = newEvent.copyWith(
        conventionId: event.id,
      );
      emit(ValidState());
    });

    on<OnChangeImageEvent>((event, emit) async {
      image = event.image;
      await MultipartFile.fromPath('image', event.image.path).then((value) {
        eventImage = value;
      });
      emit(ValidState());
    });

    on<OnSaveNewEvent>((event, emit) async {
      print(newEvent);
      bool isValidEvent = eventImage != null &&
          newEvent.title.isNotEmpty &&
          newEvent.venue.isNotEmpty &&
          newEvent.description.isNotEmpty &&
          newEvent.fullAddress.isNotEmpty;
      if (isValidEvent) {
        emit(ValidEventSucssesfulState());
      } else {
        emit(ErrorNewEventState(
          isEnable: true,
        ));
      }
    });
  }
}
