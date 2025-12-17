import 'package:flutter/material.dart';
import 'package:tudkabir/shared/utils/theming.dart';

extension AppContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ScreenSize get screenSize => switch (MediaQuery.of(this).size.width) {
    (<= 360) => ScreenSize.small,
    (<= 600) => ScreenSize.medium,
    (<= 1200) => ScreenSize.large,
    _ => ScreenSize.small,
  };

  TextTheme get textTheme => AppTextThemeExtension(screenSize).textTheme();

  ColorScheme get colorScheme => theme.colorScheme;

  Locale get locale => Localizations.localeOf(this);
}
