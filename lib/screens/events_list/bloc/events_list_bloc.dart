import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/models/events/convention/convention_model.dart';
import 'package:senpai/models/events/event/event_model.dart';

part 'events_list_event.dart';

part 'events_list_state.dart';

class EventsListBloc extends Bloc<EventsListEvent, EventsListState> {
  int page = 1;
  List<EventModel> eventsList = [];
  List<ConventionModel> conventionsList = [];
  List<EventModel> yourEventsList = [];

  EventsListBloc() : super(LoadingEventsListState()) {
    on<OnLoadEventList>((event, emit) async {
      emit(LoadingEventsListState());
    });
    on<OnLoadConventionsList>((event, emit) async {
      emit(LoadingConventionsListState());
    });
    on<OnEventsListLoaded>((event, emit) async {
      eventsList.addAll(event.eventsList);
      emit(LoadedEventsListState(eventsList));
    });
    on<OnConventionsListLoaded>((event, emit) async {
      conventionsList.addAll(event.conventionsList);
      emit(LoadedConventionsListState(conventionsList));
    });
    on<OnYourEventsListLoaded>((event, emit) async {
      yourEventsList.addAll(event.eventsList);
      emit(LoadedYourEventsListState(yourEventsList));
    });
  }
}