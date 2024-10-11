import 'package:senpai/data/path_constants.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/onboarding/widgets/onboarding_tile.dart';

class DataConstants {
  // Onboarding
  static final onboardingTiles = [
    const OnboardingTile(
      // title: R.strings.onboarding1Title,
      title: "Hey there! Welcome to\nSenpai, the ultimate haven\nfor anime",
      imagePath: PathConstants.onboarding1,
    ),
    const OnboardingTile(
      // title: R.strings.onboarding2Title,
      title:
          "Connect with fellow anime\nfans and uncover your real-\nlife anime crush!",
      imagePath: PathConstants.onboarding2,
    ),
    const OnboardingTile(
      // title: R.strings.onboarding3Title,
      title:
          "Dive into anime reels,\nphotos, and updates, and\njoin the conversation!",
      imagePath: PathConstants.onboarding3,
    ),
    const OnboardingTile(
      // title: R.strings.onboarding3Title,
      title:
          "Engage through chat, comments, likes, and participate in exciting events!",
      imagePath: PathConstants.onboarding3,
    ),
  ];
}
