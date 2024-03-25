import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:senpai/data/storage_keys_constants.dart';
import 'package:senpai/models/events/convention/convention_model.dart';
import 'package:senpai/models/events/event/event_model.dart';
import 'package:senpai/models/events/events_list_filter/events_list_filter_model.dart';

part 'events_list_event.dart';

part 'events_list_state.dart';

enum EventsListType { normal, conventions, yourEvents }

class EventsListBloc extends HydratedBloc<EventsListEvent, EventsListState> {
  EventsListFilterModel filters = EventsListFilterModel.initial();
  bool? isVerifiedUser = false;
  String userId = '';

  int eventsPage = 1;
  int conventionsPage = 1;
  int yourEventsPage = 1;
  List<EventModel> eventsList = [];
  List<ConventionModel> conventionsList = [];
  List<EventModel> yourEventsList = [];

  final ValueNotifier<EventsListType> eventsListType =
      ValueNotifier(EventsListType.normal);

  EventsListBloc() : super(LoadingEventsListState()) {
    on<OnLoadEventList>((event, emit) async {
      emit(LoadingEventsListState());
    });
    on<OnLoadConventionsList>((event, emit) async {
      emit(LoadingConventionsListState());
    });
    on<OnEventsListLoaded>((event, emit) async {
      eventsList.addAll(event.eventsList);

      if (eventsList.isNotEmpty) {
        emit(LoadedEventsListState(eventsList));
      } else {
        emit(EmptyEventsListState());
      }
    });
    on<OnConventionsListLoaded>((event, emit) async {
      conventionsList.addAll(event.conventionsList);
      emit(LoadedConventionsListState(conventionsList));
    });
    on<OnLoadYourEventsList>((event, emit) async {
      emit(LoadingYourEventsListState());
    });
    on<OnYourEventsListLoaded>((event, emit) async {
      userId = event.userId ?? userId;
      isVerifiedUser = event.verified ?? isVerifiedUser;
      yourEventsList.addAll(event.eventsList);
      emit(LoadedYourEventsListState(yourEventsList));
    });

    on<OnApplyProfileFilters>((event, emit) {
      filters = event.filters;
      eventsPage = 1;
      eventsList = [];
      eventsListType.value = EventsListType.normal;
      emit(ValidSaveEventsFiltersState());
    });

    on<OnRefreshYourEventsList>((event, emit) {
      eventsListType.value = EventsListType.yourEvents;
      emit(ValidRefreshYouEventsState());
    });
  }

  @override
  Future<void> close() {
    eventsListType.dispose();
    return super.close();
  }

  @override
  EventsListState? fromJson(Map<String, dynamic> json) {
    try {
      filters = EventsListFilterModel.fromJson(
        json[StorageKeysConstants.profileFilters],
      );
      return FetchFiltersSucssesfulState();
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(EventsListState state) {
    if (state is ValidSaveEventsFiltersState) {
      return {
        StorageKeysConstants.profileFilters: filters,
      };
    } else {
      return null;
    }
  }
}
