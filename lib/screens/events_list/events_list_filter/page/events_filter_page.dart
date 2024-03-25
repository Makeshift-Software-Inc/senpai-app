import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:senpai/models/events/events_list_filter/events_list_filter_model.dart';
import 'package:senpai/screens/events_list/bloc/events_list_bloc.dart';
import 'package:senpai/screens/events_list/events_list_filter/bloc/events_list_filter_bloc.dart';
import 'package:senpai/screens/events_list/events_list_filter/widgets/events_filter_content.dart';

@RoutePage()
class EventsFilterPage extends StatelessWidget {
  final EventsListBloc eventsListBloc;

  const EventsFilterPage({
    super.key,
    required this.eventsListBloc,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: eventsListBloc),
        BlocProvider(create: (_) {
          EventsListFilterModel initialFilters = eventsListBloc.filters;
          return EventsListFilterBloc()
            ..add(OnInitFilters(initialFilters: initialFilters));
        }),
      ],
      child: const Scaffold(
        body: SafeArea(
          child: EventsFilterContent(),
        ),
      ),
    );
  }
}
