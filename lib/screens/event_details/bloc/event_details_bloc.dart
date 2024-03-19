import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/models/events/convention/convention_model.dart';
import 'package:senpai/models/events/event_details/event_details_model.dart';

part 'event_details_event.dart';
part 'event_details_state.dart';

class EventDetailsBloc extends Bloc<EventDetailsEvent, EventDetailsState> {
  String eventId = '';
  EventDetailsModel? eventModel;
  ConventionModel? conventionModel;

  EventDetailsBloc() : super(EventDetailsInitial()) {
    on<OnInitEventDetails>((event, emit) {
      emit(LoadingEventDetailsState());
      eventId = event.eventId;
      eventModel = event.eventModel;
      emit(EventDetailsInitial());
    });

    on<OnInitConventionDetails>((event, emit) {
      emit(LoadingEventDetailsState());
      conventionModel = event.conventionModel;
      emit(EventDetailsInitial());
    });
  }
}
