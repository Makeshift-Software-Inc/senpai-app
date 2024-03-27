import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/events_list/events_list_filter/bloc/events_list_filter_bloc.dart';
import 'package:senpai/utils/constants.dart';

class EventsDistanceSlider extends StatelessWidget {
  const EventsDistanceSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsListFilterBloc, EventsListFilterState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<EventsListFilterBloc>(context);
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(R.strings.distanceTitle),
                  Text(
                    bloc.changedFilters.milesAway == bloc.maxDistance
                        ? R.strings.wholeCountryTitle
                        : '${bloc.changedFilters.milesAway} ${R.strings.miTitle}',
                  ),
                ],
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: $constants.corners.md,
                ),
                overlayShape: RoundSliderOverlayShape(
                  overlayRadius: $constants.corners.lg,
                ),
                trackHeight: 2,
                trackShape: const RectangularSliderTrackShape(),
              ),
              child: Slider(
                value: bloc.changedFilters.milesAway.toDouble(),
                min: bloc.minDistance,
                max: bloc.maxDistance,
                activeColor: $constants.palette.white,
                inactiveColor: $constants.palette.buttonBorder,
                onChanged: (double value) {
                  bloc.add(OnChangeDistance(distance: value));
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
