import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/convention_details/bloc/associated_events_bloc/associated_events_bloc.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class AssociatedEvents extends StatelessWidget {
  const AssociatedEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssociatedEventsFilterCubit,
        AssociatedEventsFilterState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: $constants.palette.white,
            borderRadius: BorderRadius.circular($constants.corners.xlg),
          ),
          child: Column(
            children: [
              SizedBox(
                height: $constants.corners.xxl,
                child: Text(
                  R.strings.associatedEventsTitle,
                  style: getTextTheme(context).headlineSmall,
                ),
              ),
              SizedBox(height: $constants.insets.sm),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildFilterButton(context,
                      title: R.strings.openInvitesFilterTitle,
                      isActive: state == AssociatedEventsFilterState.open,
                      onTap: () {
                    context
                        .read<AssociatedEventsFilterCubit>()
                        .setFilterToOpen();
                  }),
                  SizedBox(width: $constants.insets.sm),
                  _buildFilterButton(context,
                      title: R.strings.closedInvitesFilterTitle,
                      isActive: state == AssociatedEventsFilterState.filled,
                      onTap: () {
                    context
                        .read<AssociatedEventsFilterCubit>()
                        .setFilterToFilled();
                  }),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterButton(
    BuildContext context, {
    required bool isActive,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: $constants.insets.sm,
          vertical: $constants.insets.xs,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular($constants.corners.xlg),
          color: isActive ? $constants.palette.white : $constants.palette.black,
          border: Border.all(
            color: $constants.palette.buttonBorder,
          ),
        ),
        child: Text(
          title,
          style: getTextTheme(context).headlineSmall!.copyWith(
                color: isActive
                    ? $constants.palette.black
                    : $constants.palette.white,
                fontSize: 14,
              ),
        ),
      ),
    );
  }
}
