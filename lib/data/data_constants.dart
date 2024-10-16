import 'package:flutter/material.dart';
import 'package:senpai/data/path_constants.dart';
import 'package:senpai/screens/onboarding/widgets/onboarding_tile.dart';
import 'package:senpai/utils/methods/utils.dart';

class DataConstants {
  // Onboarding
  static List<OnboardingTile> getOnboardingTiles(BuildContext context) {
    return [
      OnboardingTile(
        titleWidget: Text.rich(
          TextSpan(
            text: 'Hey there! Welcome to\n',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: getWidthSize(context, 0.064),
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Senpai',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                  fontSize: getWidthSize(context, 0.064),
                ),
              ),
              TextSpan(
                text: ', the ultimate haven\nfor anime',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: getWidthSize(context, 0.064),
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        imagePath: PathConstants.onboarding1,
      ),
      const OnboardingTile(
        title:
            "Connect with fellow anime\nfans and uncover your real-\nlife anime crush!",
        imagePath: PathConstants.onboarding2,
      ),
      const OnboardingTile(
        title:
            "Dive into anime reels,\nphotos, and updates, and\njoin the conversation!",
        imagePath: PathConstants.onboarding3,
      ),
      const OnboardingTile(
        title:
            "Engage through chat, comments, likes, and participate in exciting events!",
        imagePath: PathConstants.onboarding3,
      ),
    ];
  }
}
