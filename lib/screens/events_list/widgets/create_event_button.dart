import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';

import 'package:senpai/routes/app_router.dart';
import 'package:senpai/screens/events_list/bloc/events_list_bloc.dart';
import 'package:senpai/screens/events_list/widgets/create_event_info_dialog.dart';
import 'package:senpai/screens/new_event/widgets/host_new_event_dialog.dart';
import 'package:senpai/utils/constants.dart';

import 'package:senpai/utils/methods/utils.dart';

class CreateEventButton extends StatelessWidget {
  const CreateEventButton({super.key});

  void _onTapCreateEvent(context, EventsListBloc bloc) {
    final isVerifiedUser = bloc.isVerifiedUser ?? false;

    showDialog<void>(
      context: context,
      builder: (BuildContext context) => Dialog(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: Center(
          child: isVerifiedUser
              ? HostNewEventDialog(
                  onTapOk: () {
                    context.router.pop();
                    context.router.push(const NewEventRoute()).then((_) {
                      bloc.add(OnRefreshYourEventsList());
                    });
                  },
                )
              : CreateEventInfoDialog(userId: bloc.userId),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsListBloc, EventsListState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<EventsListBloc>(context);
        if (bloc.eventsListType.value == EventsListType.yourEvents) {
          return GestureDetector(
            onTap: () {
              _onTapCreateEvent(context, bloc);
            },
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                SvgPicture.asset(
                  PathConstants.eventButtonIcon,
                  height: $constants.corners.xxl,
                ),
                Text(
                  R.strings.createEventTitle,
                  style: getTextTheme(context).bodyMedium?.copyWith(
                      color: $constants.palette.white,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
