import 'package:flutter/material.dart';
import 'dart:math' as math;

final $constants = Constants();

@immutable
class Constants {
  final appTitle = 'Senpai';

  /// Theme defaults.
  late final theme = _Theme();

  /// Animation durations.
  late final times = _Times();

  /// Rounded edge corner radiuses.
  late final corners = _Corners();

  /// Padding and margin values.
  late final insets = _Insets();

  /// Text shadows.
  late final shadows = _Shadows();

  /// Color $constants.palette.
  late final palette = _Palette();

  /// Constants for Carousel
  late final carousel = _CarouselConstants();

  /// Special values.
  late final specials = _Specials();

  /// Emoji names
  late final emojis = _EmojiNames();

  /// Constants for Match
  late final match = _MatchConstants();

  /// Constants for Spotify
  late final spotify = _SpotifyConstants();

  /// API configuration.
  late final api = _API();

  /// Element sizes.
  late final sizes = _Sizes();

  /// Map constants
  late final map = _MapConstants();

  /// Events constants
  late final events = _EventsConstants();

  /// Referral constants
  late final referral = _ReferralConstants();

  /// API keys
  late final apiKeys = _ApiKeys();
}

@immutable
class _Specials {
  final int pendingMessageIdLength = 16;

  /// Constants for Match
  late final match = _MatchConstants();

  /// Allowed countries for phone input
  late final allowedCountries = ['US', 'CA', 'JP', 'GB', 'UG', 'UA', 'BR'];

  /// Default country for phone input
  late final defaultCountry = 'US';
}

@immutable
class _Times {
  final Duration fast = const Duration(milliseconds: 300);
  final Duration med = const Duration(milliseconds: 600);
  final Duration slow = const Duration(milliseconds: 900);
  final Duration pageTransition = const Duration(milliseconds: 200);
}

@immutable
class _Corners {
  late final double xs = 6;
  late final double sm = 10;
  late final double md = 12;
  late final double lg = 16;
  late final double xlg = 20;
  late final double xl = 30;
  late final double xxl = 40;
  late final double rounded = 100;
}

@immutable
class _Insets {
  late final double xxxs = 1;
  late final double xxs = 4;
  late final double xs = 8;
  late final double sm = 16;
  late final double md = 24;
  late final double lg = 32;
  late final double xl = 48;
  late final double xxl = 56;
  late final double offset = 80;
}

@immutable
class _Palette {
  final white = const Color(0xFFFFFFFF);
  final black = const Color(0xFF000000);
  final pink = const Color(0xFFDE0BC9);
  final blue = const Color(0xFF1286F0);
  final blue2 = const Color(0xFF3559bd);
  final lightBlue = const Color(0xFF1A1D28);
  final darkBlue = const Color(0xFF0E1018);
  final grey = const Color(0xFFA9AFC2);
  final grey2 = const Color(0xFF98A1BB);
  final darkGrey = const Color(0xFF5B6277);
  final darkGrey2 = const Color(0xFF2E3A62);
  final darkGrey3 = const Color(0xFF344256);
  final yellow = const Color(0xFFFFB200);
  final gold = const Color(0xFFE39F04);
  final green = const Color(0xFF67B527);
  final green2 = const Color(0xFF19CC60);
  final red = const Color(0xFFFF3A3D);
  final buttonBackground = const Color(0xB214161D);
  final appBackground = const Color(0xFF14161D);
  final progressBackground = const Color(0xFF1F2542);
  final buttonBorder = const Color(0xFF363B4B);

  final loadingBackground = const Color(0x4414161D);

  final disabledTextButton = const Color(0xFF98A1BB);
  final folderBackground = const Color(0xFF1C2431);

  // gradients
  final flipCardBgGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        const Color(0xFFE39F04),
        const Color(0xFFE39F04),
        const Color(0xFF000000).withOpacity(0.5),
      ]);

  final mainGradient = const LinearGradient(
      colors: [Color(0xFFDE0BC9), Color(0xFF1286F0)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      transform: GradientRotation(135.62 * math.pi / 180),
      stops: [0.1585, 0.8491]);

  final buttonGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFDE0BC9),
      Color(0xFF1286F0),
    ],
    stops: [0.1531, 0.8686],
    transform: GradientRotation(
        123.56 * 3.141592653589793 / 180), // Convert degrees to radians
  );

  final lineGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1286F0),
      Color(0xFFDE0BC9),
    ],
    stops: [0.1531, 0.8686],
    transform: GradientRotation(
        123.56 * 3.141592653589793 / 180), // Convert degrees to radians
  );

  final matchGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFF0E1018).withOpacity(0),
      const Color(0xFF0E1018).withOpacity(0.5),
      const Color(0xFF0E1018).withOpacity(0.75),
      const Color(0xFF0E1018),
      const Color(0xFF0E1018),
    ],
  );

  final matchDislikeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFF0E1018).withOpacity(0),
      const Color(0xFF0E1018),
    ],
  );
  final aboutEventGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFF1C2431),
      const Color(0xFF1C2431).withOpacity(0.2),
    ],
  );

  final eventHostGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      const Color(0xFFFFFFFF).withOpacity(0),
      const Color(0xFFFFFFFF),
      const Color(0xFFFFFFFF).withOpacity(0),
    ],
  );
}

@immutable
class _Theme {
  final tryToGetColorPaletteFromWallpaper = false;
  final defaultThemeColor = const Color(0xFF0E1018);
  final defaultFontFamily = 'Lato';
  final secondaryFontFamily = 'Geomanist';
  final tertiaryFontFamily = 'Prompt';
  final double defaultElevation = 0;
  final double defaultBorderRadius = 16;
}

@immutable
class _Shadows {
  final textSoft = [
    Shadow(
        color: Colors.black.withOpacity(0.25),
        offset: const Offset(0, 2),
        blurRadius: 4),
  ];
  final text = [
    Shadow(
        color: Colors.black.withOpacity(0.6),
        offset: const Offset(0, 2),
        blurRadius: 2),
  ];
  final textStrong = [
    Shadow(
        color: Colors.black.withOpacity(0.6),
        offset: const Offset(0, 4),
        blurRadius: 6),
  ];
}

@immutable
class _CarouselConstants {
  late final double direction = 1.0;
  late final double indicatorHeight = 2;
  late final double topMargin = 34;
  late final double startMargin = 20;
  late final double marginAmount = 64;
}

@immutable
class _EmojiNames {
  late final String happy = 'joy';
  late final String like = 'thumbsup';
  late final String heart = 'heart';
  late final String vomit = 'nauseated_face';
  late final String anger = 'rage';
  late final String demon = 'imp';
}

@immutable
class _MatchConstants {
  late final double blur = 3.0;
  late final double bottomMiddleButtons = 90.0;
  late final double widthCenterMiddleButtons = 100.0;
  late final double heightCenterBox = 95.0;
  late final double widthCenterBox = 138.0;
  late final double matchBottomHeight = 220.0;
}

@immutable
class _SpotifyConstants {
  late final double spotifyImageSize = 98;
  late final double spotifyPlayPadding = 28;
  late final double spotifyTracksHeight = 190;
  late final double spotifyArtistsHeight = 150;
  late final double spotifyCheckBoxHeight = 84;
  late final double spotifyImageTrackHeight = 68;
}

@immutable
class _API {
  final maxMessagesToBeFetchedAtOneTime = 50;
  final maxStickersToBeFetchedAtOneTime = 30;
  final maxSizeForAttachmentsInMB = 40;
}

@immutable
class _Sizes {
  late final double buttonHeight = 28;
  late final double animeTileHeight = 72;
  late final double smallButtonWidth = 100;
  late final double smallButtonHeight = 32;
  late final double attachmentsIconSize = 36;
  late final double attachmentsBottomSheetSize = 100;
}

@immutable
class _MapConstants {
  late final zoom = 15.0;
  late final markerId = 'event';
}

@immutable
class _EventsConstants {
  late final double eventListItemHeight = 235;
  late final double eventListImageHeight = 206;
  late final double eventListNotchedContainerHeight = 63;
  late final double eventListRoundContainerSize = 50;
  late final double newEventImageHeight = 200;
  late final String searchTag = 'searchEvents';
  late final double eventDetailsImageHeight = 300;
  late final double eventDetailsLocationHeight = 436;
  late final double eventDetailsMembersHeight = 650;
  late final double eventMembersCenterBGHeight = 150;
  late final double eventMembersCircleBGHeight = 120;
  late final double eventMembersCenterImageSize = 112;
  late final double eventCosplaySize = 74;
  late final double eventMembersBlur = 16;
  late final double eventHostHeight = 130;
}

@immutable
class _ReferralConstants {
  late final double invitedFriendsContainerHeight = 144;
  late final double premiumWidgetWidth = 89;
  late final double premiumWidgetHeight = 83;
  late final double qrCodeSize = 125;
  late final double premiumDialogContainerHeight = 370;
  late final double premiumDialogContainerHeight2 = 380;
  late final double qrDialogContainerHeight = 350;
  late final double qrDialogContainerHeight2 = 360;
}

@immutable
class _ApiKeys {
  late final placesApiKey = 'AIzaSyBTY9seNFQSG-Gem59s9V7wVeqg12j-pAQ';
}
