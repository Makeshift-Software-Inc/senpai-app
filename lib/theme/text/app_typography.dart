import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:senpai/theme/text/app_text_theme.dart';
import 'package:senpai/utils/constants.dart';

part 'app_typography.freezed.dart';

@freezed
class AppTypography with _$AppTypography {
  factory AppTypography({
    required AppTextTheme black,
    required AppTextTheme white,
  }) = _AppTypography;

  const AppTypography._();

  factory AppTypography.create(
          {required String fontFamily,
          required String secondaryFontFamily,
          required String tertiaryFontFamily}) =>
      AppTypography(
        black: _createTextTheme(fontFamily, secondaryFontFamily,
            tertiaryFontFamily, $constants.palette.black),
        white: _createTextTheme(fontFamily, secondaryFontFamily,
            tertiaryFontFamily, $constants.palette.white),
      );

  Typography get materialTypography => Typography.material2021(
        platform: null,
        black: black.materialTextTheme,
        white: white.materialTextTheme,
      );

  static AppTextTheme _createTextTheme(String fontFamily,
          String secondaryFontFamily, String tertiaryFontFamily, Color color) =>
      AppTextTheme(
        displayLarge: TextStyle(
          debugLabel: 'appTextTheme displayLarge',
          color: color,
          fontSize: 48,
          fontWeight: FontWeight.w700,
          fontFamily: secondaryFontFamily,
          textBaseline: TextBaseline.alphabetic,
          height: 1,
        ),
        displayMedium: TextStyle(
          debugLabel: 'appTextTheme displayMedium',
          color: color,
          fontSize: 48,
          fontWeight: FontWeight.w400,
          fontFamily: secondaryFontFamily,
          textBaseline: TextBaseline.alphabetic,
          height: 1,
        ),
        displaySmall: TextStyle(
          debugLabel: 'appTextTheme displaySmall',
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: tertiaryFontFamily,
          textBaseline: TextBaseline.alphabetic,
          height: 2,
        ),
        headlineLarge: TextStyle(
          debugLabel: 'appTextTheme headlineLarge',
          color: color,
          fontSize: 32,
          fontWeight: FontWeight.w700,
          fontFamily: fontFamily,
          textBaseline: TextBaseline.alphabetic,
          height: 1.25,
        ),
        headlineMedium: TextStyle(
          debugLabel: 'appTextTheme headlineMedium',
          color: color,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
          textBaseline: TextBaseline.alphabetic,
          height: 1.333,
        ),
        headlineSmall: TextStyle(
          debugLabel: 'appTextTheme headlineSmall',
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
          textBaseline: TextBaseline.alphabetic,
          height: 1.5,
        ),
        titleLarge: TextStyle(
          debugLabel: 'appTextTheme titleLarge',
          color: color,
          fontSize: 21,
          fontWeight: FontWeight.w700,
          fontFamily: fontFamily,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0,
        ),
        titleMedium: TextStyle(
          debugLabel: 'appTextTheme titleMedium',
          color: color,
          fontSize: 17,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.15,
        ),
        titleSmall: TextStyle(
          debugLabel: 'appTextTheme titleSmall',
          color: color,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.5,
        ),
        bodyLarge: TextStyle(
          debugLabel: 'appTextTheme bodyLarge',
          color: color,
          fontSize: 15,
          fontWeight: FontWeight.w700,
          fontFamily: fontFamily,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.25,
        ),
        bodyMedium: TextStyle(
          debugLabel: 'appTextTheme bodyMedium',
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
          textBaseline: TextBaseline.alphabetic,
          height: 24,
        ),
        bodySmall: TextStyle(
          debugLabel: 'appTextTheme bodySmall',
          color: color,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.1,
        ),
        labelLarge: TextStyle(
          debugLabel: 'appTextTheme labelLarge',
          color: color,
          fontSize: 15,
          fontWeight: FontWeight.w700,
          fontFamily: fontFamily,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 1.25,
        ),
        labelMedium: TextStyle(
          debugLabel: 'appTextTheme labelMedium',
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
          textBaseline: TextBaseline.alphabetic,
          height: 1.5,
        ),
        labelSmall: TextStyle(
          debugLabel: 'appTextTheme labelSmall',
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 1.5,
        ),
      );
}
