import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senpai/data/path_constants.dart';

class LobbyInformationWidget extends StatelessWidget {
  const LobbyInformationWidget(
      {Key? key, required this.userImages, required this.usersInLobby})
      : super(key: key);

  final int usersInLobby;
  final List<String> userImages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.037,
          right: MediaQuery.of(context).size.width * 0.037),
      child: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.048,
            left: MediaQuery.of(context).size.width * 0.042,
            right: MediaQuery.of(context).size.width * 0.042),
        height: MediaQuery.of(context).size.width * 0.42,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(PathConstants.folderBackground),
            fit: BoxFit.contain,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLobbyHeaderText(context),
            SizedBox(height: MediaQuery.of(context).size.width * 0.03),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.white.withOpacity(0.07),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.14),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.018),
                      child: Center(
                        child: Text(
                          'Waiting in the lobby: $usersInLobby',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.037,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                _buildAvatarsOverlay(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLobbyHeaderText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.width * 0.02),
            Text(
              'Lobby',
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Users currently in the Lobby.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
          ],
        ),
        SvgPicture.asset(
          PathConstants.lobbyIcon, // replace with your icon path
          width: MediaQuery.of(context).size.width * 0.1,
          height: MediaQuery.of(context).size.width * 0.1,
        ),
      ],
    );
  }

  Widget _buildAvatarsOverlay(BuildContext context) {
    return SizedBox(
      width: 100.0,
      height: 40.0,
      child: Stack(
        children: [
          for (int i = 0;
              i < (userImages.length > 3 ? 3 : userImages.length);
              i++)
            Positioned(
              left: (2 - i) * 20.0,
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(userImages[userImages.length - 1 - i]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          if (userImages.length > 3)
            const Positioned(
              left: 60.0,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 20.0,
                child: Icon(Icons.more_horiz, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
