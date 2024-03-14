import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/models/events/convention/convention_model.dart';

part 'new_event_convention_event.dart';
part 'new_event_convention_state.dart';

class NewEventConventionBloc
    extends Bloc<NewEventConventionEvent, NewEventConventionState> {
  TextEditingController searchController = TextEditingController();

  List<ConventionModel> conventionsList = [];
  ConventionModel? selectedConvention;
  String searchText = '';
  int page = 1;

  NewEventConventionBloc() : super(NewEventConventionInitial()) {
    on<OnInitNewEventConvention>((event, emit) {
      emit(LoadingNewEventConventionState());
      conventionsList = event.conventionsList;
      emit(NewEventConventionInitial());
    });

    on<OnChangeSearchConventionEvent>((event, emit) {
      searchText = event.searchText;
    });

    on<OnSelectConvention>((event, emit) {
      emit(LoadingNewEventConventionState());
      if (event.convention != null) {
        selectedConvention = event.convention;
        emit(SelectConventionSucssesfulState());
      } else {
        emit(NewEventConventionInitial());
      }
    });
  }
}
