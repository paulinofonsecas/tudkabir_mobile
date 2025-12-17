import 'package:flutter/material.dart';

enum ScreenSize {
  small,
  medium,
  large,
}

class AppTheme {
  static Color primaryColor = const Color(0xff0043c9);
  static Color secondaryColor = const Color(0xfff4f6f8);
  static Color borderTextFieldColor = const Color(0xffe9ebf8);
  static Color subtitleColor = const Color(0xff868686);

  static ThemeData appTheme = ThemeData(
    useMaterial3: false,
    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.white,
      entryModeIconColor: primaryColor,
      hourMinuteColor: Colors.white,
      hourMinuteShape: const CircleBorder(),
      hourMinuteTextColor: primaryColor,
      dayPeriodShape: const CircleBorder(),
      dayPeriodTextColor: Colors.white,
      dayPeriodColor: primaryColor,
      dialBackgroundColor: Colors.white,
      dialHandColor: primaryColor,
      dialTextColor: Colors.black,
      cancelButtonStyle: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) => Colors.white,
        ),
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) => primaryColor,
        ),
      ),
      confirmButtonStyle: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.disabled)
              ? Colors.grey
              : primaryColor,
        ),
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) => Colors.white,
        ),
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: secondaryColor,
      onSecondary: Colors.black,
      error: Colors.red[400]!,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
      tertiary: const Color(0xccFFCE00),
      onTertiary: Colors.black,
    ),
  );
}

class AppTextThemeExtension {
  AppTextThemeExtension(this.screenSize);

  final ScreenSize screenSize;

  TextTheme textTheme() => switch (screenSize) {
    ScreenSize.small => const TextTheme(
      labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
      headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
      titleSmall: TextStyle(fontSize: 14),
      titleMedium: TextStyle(fontSize: 18),
      titleLarge: TextStyle(fontSize: 18),
    ),
    ScreenSize.medium => const TextTheme(
      labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
      labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
      headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
      titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    ),
    _ => const TextTheme(
      labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
      labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
      headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
      titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      titleLarge: TextStyle(
        fontSize: 20,
      ),
    ),
  };
}
