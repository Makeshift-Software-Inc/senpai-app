import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/screens/match_users/bloc/match_users_bloc.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class MatchHeartWidget extends StatelessWidget {
  final bool chageSize;
  const MatchHeartWidget({
    Key? key,
    this.chageSize = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height:
          chageSize ? getSize(context).height / 2 : $constants.insets.offset,
      width: chageSize ? getSize(context).width / 2 : $constants.insets.offset,
      duration: $constants.times.slow,
      curve: Curves.easeIn,
      onEnd: () {
        final bloc = BlocProvider.of<MatchUsersBloc>(context);
        bloc.add(OnFinishTimerEvent());
      },
      child: SvgPicture.asset(
        PathConstants.matchHeartBgIcon,
        height: $constants.insets.offset,
        width: $constants.insets.offset,
      ),
    );
  }
}