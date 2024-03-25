import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senpai/core/widgets/primary_button.dart';
import 'package:senpai/core/widgets/senpai_app_bar.dart';
import 'package:senpai/core/widgets/senpai_checkbox.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/models/events/events_list_filter/events_list_filter_model.dart';
import 'package:senpai/screens/events_list/bloc/events_list_bloc.dart';
import 'package:senpai/screens/events_list/events_list_filter/bloc/events_list_filter_bloc.dart';
import 'package:senpai/screens/events_list/events_list_filter/widgets/event_filter_date_widget.dart';
import 'package:senpai/screens/events_list/events_list_filter/widgets/events_distance_slider.dart';
import 'package:senpai/screens/events_list/events_list_filter/widgets/host_raiting_widget.dart';
import 'package:senpai/screens/new_event/widgets/new_event_cosplay_widget.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class EventsFilterContent extends StatelessWidget {
  const EventsFilterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsListFilterBloc, EventsListFilterState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<EventsListFilterBloc>(context);

        return Column(
          children: [
            SizedBox(height: $constants.insets.xs),
            SenpaiAppBar(
              title: R.strings.filterTitle,
              actions: [_buildAppBarAction(context)],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: $constants.insets.lg),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: $constants.insets.sm),
                      child: const EventsDistanceSlider(),
                    ),
                    SizedBox(height: $constants.insets.lg),
                    EventFilterDateWidget(
                      title: R.strings.startDateTitle,
                      date: bloc.changedFilters.startDate,
                      onDateTimeChanged: (date) {
                        bloc.add(OnChangeStartDate(startDate: date));
                      },
                    ),
                    SizedBox(height: $constants.insets.xs),
                    EventFilterDateWidget(
                      title: R.strings.endDateTitle,
                      date: bloc.changedFilters.endDate ?? DateTime.now(),
                      onDateTimeChanged: (date) {
                        bloc.add(OnChangeEndDate(endDate: date));
                      },
                    ),
                    SizedBox(height: $constants.insets.lg),
                    _buildEventIsFree(context),
                    SizedBox(height: $constants.insets.xs),
                    _buildEventIsPaid(context),
                    Padding(
                      padding: EdgeInsets.all($constants.insets.sm),
                      child: NewEventCosplayWidget(
                          cosplayStatusIndex: bloc.cosplayStatusIndex,
                          onTap: (index) {
                            bloc.add(OnChangeCosplayStatus(index));
                          }),
                    ),
                    HostRaitingWidget(
                      initialRating: bloc.changedFilters.hostRating ?? 0,
                    ),
                    SizedBox(height: $constants.insets.xs),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
                child: _buildApplyButton(context),
              ),
            ),
            SizedBox(height: $constants.insets.sm),
          ],
        );
      },
    );
  }

  Widget _buildEventIsFree(BuildContext context) {
    final bloc = BlocProvider.of<EventsListFilterBloc>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
      child: SenpaiCheckBox(
        title: '',
        optionalContent: Text(
          R.strings.freeTitle,
          style: getTextTheme(context).bodyMedium?.copyWith(
                color: $constants.palette.green,
                fontWeight: FontWeight.w900,
              ),
        ),
        value: bloc.changedFilters.isFree ?? false,
        onChanged: (bool? value) {
          bloc.add(OnChangeFreeStatusEvent(isFree: value ?? false));
        },
      ),
    );
  }

  Widget _buildEventIsPaid(BuildContext context) {
    final bloc = BlocProvider.of<EventsListFilterBloc>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
      child: SenpaiCheckBox(
        title: '',
        optionalContent: Row(
          children: [
            Text(R.strings.paidTitle),
            SizedBox(width: $constants.insets.xs),
            SvgPicture.asset(
              PathConstants.paidFilterIcon,
              width: $constants.corners.xlg,
              height: $constants.corners.xlg,
            ),
          ],
        ),
        value: bloc.changedFilters.isPaid ?? false,
        onChanged: (bool? value) {
          bloc.add(OnChangePaidStatus(isPaid: value ?? false));
        },
      ),
    );
  }

  Widget _buildApplyButton(BuildContext context) {
    final bloc = BlocProvider.of<EventsListFilterBloc>(context);
    final listBloc = BlocProvider.of<EventsListBloc>(context);
    return BlocListener<EventsListFilterBloc, EventsListFilterState>(
      listenWhen: (_, currState) => currState is ValidSaveState,
      listener: (context, state) async {
        listBloc.add(OnApplyProfileFilters(filters: bloc.changedFilters));
      },
      child: BlocListener<EventsListBloc, EventsListState>(
        listenWhen: (_, currState) => currState is ValidSaveEventsFiltersState,
        listener: (context, state) async {
          await context.router.pop();
        },
        child: PrimaryButton(
          text: bloc.counterChangesList.isEmpty
              ? R.strings.applyTitle
              : '${R.strings.applyChangesTitle} (${bloc.counterChangesList.length})',
          onPressed: () {
            bloc.add(OnApplyFilters());
          },
        ),
      ),
    );
  }

  Widget _buildAppBarAction(BuildContext context) {
    final listBloc = BlocProvider.of<EventsListBloc>(context);
    return BlocListener<EventsListBloc, EventsListState>(
      listenWhen: (_, currState) => currState is ValidSaveEventsFiltersState,
      listener: (context, state) async {
        await context.router.pop();
      },
      child: GestureDetector(
        onTap: () async {
          await context.router.pop();
          listBloc.add(
            OnApplyProfileFilters(
              filters: EventsListFilterModel.initial(),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.only(right: $constants.insets.sm),
          child: Text(
            R.strings.clearAllTitle,
            style: getTextTheme(context).bodySmall!.copyWith(letterSpacing: 0),
          ),
        ),
      ),
    );
  }
}
