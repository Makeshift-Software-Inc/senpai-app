import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:senpai/dependency_injection/injection.dart';
import 'package:senpai/models/auth/auth_model.dart';
import 'package:senpai/models/events/convention/convention_model.dart';
import 'package:senpai/models/events/event_details/event_details_model.dart';
import 'package:senpai/models/events/join_request/join_request_model.dart';
import 'package:senpai/models/user_profile/user_profile_model.dart';

part 'event_details_event.dart';
part 'event_details_state.dart';

class EventDetailsBloc extends Bloc<EventDetailsEvent, EventDetailsState> {
  String eventId = '';
  String userId = '';

  EventDetailsModel? eventModel;
  ConventionModel? conventionModel;
  UserProfileModel? hostModel;
  List<JoinRequestModel> requestsList = [];
  String joinRequestId = '';

  EventDetailsBloc() : super(EventDetailsInitial()) {
    on<OnInitEventDetails>((event, emit) async {
      emit(LoadingEventDetailsState());
      final storage = getIt<TokenStorage<AuthModel>>();
      await storage.read().then((data) {
        if (data != null) {
          userId = data.user.id;
        }
      });
      eventId = event.eventId;
      eventModel = event.eventModel;
      emit(EventDetailsInitial());
    });

    on<OnInitConventionDetails>((event, emit) {
      emit(LoadingEventDetailsState());
      conventionModel = event.conventionModel;
      emit(EventDetailsInitial());
    });

    on<OnInitHostModelDetails>((event, emit) {
      emit(LoadingEventDetailsState());
      hostModel = event.hostModel;
      emit(EventDetailsInitial());
    });

    on<OnFetchJoinRequest>((event, emit) {
      emit(LoadingEventDetailsState());
      requestsList = event.requestsList;
      emit(EventDetailsInitial());
    });

    on<OnSaveJoinRequestId>((event, emit) {
      emit(LoadingEventDetailsState());
      joinRequestId = event.joinRequestId;
      emit(EventDetailsInitial());
    });
  }
}
