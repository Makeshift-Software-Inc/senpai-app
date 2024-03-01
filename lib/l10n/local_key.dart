import 'package:flutter/material.dart';
import 'package:senpai/l10n/resources.dart';

enum LocaleKey { en, ja, pt }

extension LocaleKeyExtension on LocaleKey {
  String get value {
    switch (this) {
      case LocaleKey.en:
        return 'en';
      case LocaleKey.ja:
        return 'ja';
      case LocaleKey.pt:
        return 'pt';
    }
  }

  String get name {
    switch (this) {
      case LocaleKey.en:
        return R.strings.english;
      case LocaleKey.ja:
        return R.strings.japanese;
      case LocaleKey.pt:
        return R.strings.portuguese;
    }
  }

  String get nativeName {
    switch (this) {
      case LocaleKey.en:
        return R.strings.englishNotTranslated;
      case LocaleKey.ja:
        return R.strings.japaneseNotTranslated;
      case LocaleKey.pt:
        return R.strings.portugueseNotTranslated;
    }
  }

  Locale get toLocale => Locale(value);

  static LocaleKey parse(String str) {
    switch (str) {
      case 'en':
        return LocaleKey.en;
      case 'ja':
        return LocaleKey.ja;
      case 'pt':
        return LocaleKey.pt;
      default:
        return LocaleKey.en;
    }
  }

  static String format(LocaleKey localeKey) {
    return localeKey.name;
  }

  static List<Locale> valuesToLocaleList() =>
      LocaleKey.values.map((localeKey) => localeKey.toLocale).toList();

  static Map<LocaleKey, String> valuesToMap() => {for (final e in LocaleKey.values) e: format(e)};
}