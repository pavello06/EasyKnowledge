import 'package:easy_knowledge/core/theme/app_palette.dart';
import 'package:easy_knowledge/core/theme/app_text.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData _data(AppPalette palette) => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: palette.primary(),
      brightness: palette.brightness(),
      primary: palette.primary(),
      secondary: palette.secondary(),
      tertiary: palette.tertiary(),
    ),
    appBarTheme: AppBarThemeData(
      backgroundColor: palette.tertiary(),
      surfaceTintColor: palette.tertiary(),
      titleTextStyle: AppText.textTheme.titleLarge?.copyWith(
        color: palette.secondary(),
        overflow: TextOverflow.ellipsis,
      ),
    ),
    scaffoldBackgroundColor: palette.primary(),
    iconTheme: IconThemeData(color: palette.secondary()),
    textTheme: AppText.textTheme,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: palette.secondary(),
    ),
  );

  static ThemeData light() => _data(AppPaletteLight());

  static ThemeData dark() => _data(AppPaletteDark());
}
