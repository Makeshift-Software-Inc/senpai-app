import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:senpai/dependency_injection/injection.dart';
import 'package:senpai/models/auth/auth_model.dart';
import 'package:senpai/models/events/events_list_filter/events_list_filter_model.dart';
import 'package:senpai/screens/new_event/enums/new_event_enums.dart';

part 'events_list_filter_event.dart';
part 'events_list_filter_state.dart';

enum EventsFiltersEnums {
  milesAway,
  startDate,
  endDate,
  isFree,
  isPaid,
  cosplayStatus,
  hostRating;
}

class EventsListFilterBloc
    extends Bloc<EventsListFilterEvent, EventsListFilterState> {
  String userID = '';

  double minDistance = 1.0;
  double maxDistance = 200.0;

  EventsListFilterModel initialFilters = EventsListFilterModel.initial();
  EventsListFilterModel changedFilters = EventsListFilterModel.initial();
  Set<EventsFiltersEnums> counterChangesList = Set.identity();

  int? cosplayStatusIndex;

  EventsListFilterBloc() : super(EventsListFilterInitial()) {
    on<OnInitFilters>((event, emit) {
      emit(LoadingFiltersState());
      initialFilters = event.initialFilters;
      changedFilters = event.initialFilters;
      cosplayStatusIndex = event.initialFilters.cosplayStatus?.index;
      emit(ValidState());
    });

    on<OnChangeDistance>((event, emit) async {
      emit(LoadingFiltersState());

      if (userID.isEmpty) {
        final storage = getIt<TokenStorage<AuthModel>>();
        await storage.read().then((data) {
          if (data != null) {
            userID = data.user.id;
          }
        });
      }

      changedFilters = changedFilters.copyWith(
        userId: event.distance != maxDistance ? userID : null,
        milesAway: event.distance.toInt(),
      );
      changedFilters.milesAway != initialFilters.milesAway
          ? counterChangesList.add(EventsFiltersEnums.milesAway)
          : counterChangesList.remove(EventsFiltersEnums.milesAway);
      emit(FetchSucssesfulState());
    });

    on<OnChangePaidStatus>((event, emit) {
      emit(LoadingFiltersState());

      changedFilters = changedFilters.copyWith(
        isPaid: event.isPaid,
      );

      changedFilters.isPaid != initialFilters.isPaid
          ? counterChangesList.add(EventsFiltersEnums.isPaid)
          : counterChangesList.remove(EventsFiltersEnums.isPaid);
      if (event.isPaid && changedFilters.isFree == true) {
        add(OnChangeFreeStatusEvent(isFree: false));
      }
      emit(FetchSucssesfulState());
    });

    on<OnChangeFreeStatusEvent>((event, emit) {
      emit(LoadingFiltersState());

      changedFilters = changedFilters.copyWith(
        isFree: event.isFree,
      );

      changedFilters.isFree != initialFilters.isFree
          ? counterChangesList.add(EventsFiltersEnums.isFree)
          : counterChangesList.remove(EventsFiltersEnums.isFree);

      if (event.isFree && changedFilters.isPaid == true) {
        add(OnChangePaidStatus(isPaid: false));
      }
      emit(FetchSucssesfulState());
    });

    on<OnChangeStartDate>((event, emit) {
      emit(LoadingFiltersState());
      changedFilters = changedFilters.copyWith(
        startDate: event.startDate,
      );
      changedFilters.startDate != initialFilters.startDate
          ? counterChangesList.add(EventsFiltersEnums.startDate)
          : counterChangesList.remove(EventsFiltersEnums.startDate);
      emit(FetchSucssesfulState());
    });

    on<OnChangeEndDate>((event, emit) {
      emit(LoadingFiltersState());
      changedFilters = changedFilters.copyWith(
        endDate: event.endDate,
      );
      changedFilters.endDate != initialFilters.endDate
          ? counterChangesList.add(EventsFiltersEnums.endDate)
          : counterChangesList.remove(EventsFiltersEnums.endDate);
      emit(FetchSucssesfulState());
    });

    on<OnChangeCosplayStatus>((event, emit) {
      emit(LoadingFiltersState());
      if (cosplayStatusIndex == event.index) {
        cosplayStatusIndex = null;
        changedFilters = changedFilters.copyWith(
          cosplayStatus: null,
        );
      } else {
        cosplayStatusIndex = event.index;
        changedFilters = changedFilters.copyWith(
          cosplayStatus: CosplayStatus.values[event.index],
        );
      }
      changedFilters.cosplayStatus != initialFilters.cosplayStatus
          ? counterChangesList.add(EventsFiltersEnums.cosplayStatus)
          : counterChangesList.remove(EventsFiltersEnums.cosplayStatus);
      emit(FetchSucssesfulState());
    });

    on<OnChangeHostRating>((event, emit) {
      emit(LoadingFiltersState());
      changedFilters = changedFilters.copyWith(
        hostRating: event.hostRating != 0 ? event.hostRating : null,
      );
      changedFilters.hostRating != initialFilters.hostRating
          ? counterChangesList.add(EventsFiltersEnums.hostRating)
          : counterChangesList.remove(EventsFiltersEnums.hostRating);
      emit(FetchSucssesfulState());
    });

    on<OnApplyFilters>((event, emit) {
      changedFilters = changedFilters.copyWith(
        paymentRequired: _handlePaymentRequired(
          isFree: changedFilters.isFree,
          isPaid: changedFilters.isPaid,
        ),
      );
      emit(ValidSaveState());
    });

    on<OnClearAllFilters>((event, emit) {
      emit(ClearAllFiltersState());
    });
  }

  bool? _handlePaymentRequired({bool? isFree = false, bool? isPaid = false}) {
    if (isPaid == true) {
      return true;
    } else if (isFree == true) {
      return false;
    } else {
      return null;
    }
  }
}
