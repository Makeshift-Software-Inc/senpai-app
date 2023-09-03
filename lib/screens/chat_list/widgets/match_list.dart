import 'package:flutter/material.dart';
import 'package:senpai/core/widgets/user_avator_named.dart';
import 'package:senpai/models/match/match_user_data.dart';
import 'package:senpai/utils/constants.dart';

class MatchList extends StatelessWidget {
  final List<MatchUserData> users; // List of user data

  const MatchList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: users.map((user) {
          return Padding(
            padding: EdgeInsets.only(right: $constants.corners.md),
            child: UserAvatarWithName(
              imageUrl: user.imageUrl,
              userName: user.userName,
              isOnline: user.isOnline,
            ),
          );
        }).toList(),
      ),
    );
  }
}
