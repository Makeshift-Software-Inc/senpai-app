import 'package:flutter_bloc/flutter_bloc.dart';

enum AssociatedEventsFilterState { open, filled }

class AssociatedEventsFilterCubit extends Cubit<AssociatedEventsFilterState> {
  AssociatedEventsFilterCubit()
      : super(AssociatedEventsFilterState.open); // Default state is 'open'

  void setFilterToOpen() => emit(AssociatedEventsFilterState.open);
  void setFilterToFilled() => emit(AssociatedEventsFilterState.filled);
}
