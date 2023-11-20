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
  late final double sm = 10;
  late final double md = 12;
  late final double lg = 16;
  late final double xl = 30;
  late final double xxl = 40;
}

@immutable
class _Insets {
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
  final lightBlue = const Color(0xFF1A1D28);
  final darkBlue = const Color(0xFF0E1018);
  final grey = const Color(0xFFA9AFC2);
  final grey2 = const Color(0xFF98A1BB);
  final darkGrey = const Color(0xFF5B6277);
  final yellow = const Color(0xFFFFB200);
  final green = const Color(0xFF67B527);
  final red = const Color(0xFFFF3A3D);
  final buttonBackground = const Color(0xB214161D);
  final appBackground = const Color(0xFF14161D);
  final progressBackground = const Color(0xFF1F2542);
  final buttonBorder = const Color(0xFF363B4B);

  final loadingBackground = const Color(0x4414161D);

  final disabledTextButton = const Color(0xFF98A1BB);

  // gradients
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
