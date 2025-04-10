import 'package:flutter/material.dart';

sealed class AppThemeConfig {
  Brightness get brightness;
  Color get primary;
  Color get primaryContainer;
  Color get onPrimary;
  Color get accent;
  Color get background;
  Color get surface;
  Color get surfaceVariant;

  InputBorder get inputBorder => OutlineInputBorder(borderSide: BorderSide(color: primary));

  ThemeData get themeData => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      brightness: brightness,
      surface: surface,
      primary: primary,
      surfaceContainerHighest: surfaceVariant,
      primaryContainer: primaryContainer,
      onPrimary: onPrimary,
      onPrimaryContainer: onPrimary,
      secondary: accent,
    ),
    iconTheme: IconThemeData(color: primary),
    dividerColor: primary,
    scaffoldBackgroundColor: background,
    dividerTheme: DividerThemeData(color: primary, thickness: 1, indent: 4, endIndent: 4),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: background, circularTrackColor: accent),
    inputDecorationTheme: InputDecorationTheme(
      border: inputBorder,
      enabledBorder: inputBorder,
      focusedBorder: inputBorder.copyWith(borderSide: inputBorder.borderSide.copyWith(width: 2)),
      outlineBorder: BorderSide(color: primary),
      disabledBorder: inputBorder.copyWith(borderSide: inputBorder.borderSide.copyWith(color: Colors.grey)),
    ),
    cardTheme: const CardTheme(clipBehavior: Clip.hardEdge),
    unselectedWidgetColor: onPrimary,
    listTileTheme: ListTileThemeData(selectedColor: onPrimary, selectedTileColor: primary),
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent, foregroundColor: primary, elevation: 0),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStatePropertyAll(primary),
      thumbColor: WidgetStatePropertyAll(onPrimary),
    ),
    buttonTheme: ButtonThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: primary, foregroundColor: onPrimary),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(backgroundColor: Colors.transparent, foregroundColor: primary),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: primary,
        side: BorderSide(color: primary),
      ),
    ),
  );
}

class LightAppTheme extends AppThemeConfig {
  @override
  Brightness get brightness => Brightness.light;
  @override
  Color get primary => const Color.fromARGB(255, 20, 20, 90);
  @override
  Color get onPrimary => Colors.white;
  @override
  Color get primaryContainer => const Color.fromARGB(255, 77, 90, 177);
  @override
  Color get accent => Colors.purple.shade200;
  @override
  Color get background => Colors.grey.shade200;
  @override
  Color get surface => Colors.white;
  @override
  Color get surfaceVariant => Colors.grey.shade100;
}

class DarkAppTheme extends AppThemeConfig {
  @override
  Brightness get brightness => Brightness.dark;
  @override
  Color get primary => const Color.fromARGB(255, 20, 20, 90);
  @override
  Color get onPrimary => Colors.white;
  @override
  Color get primaryContainer => const Color.fromARGB(255, 90, 100, 237);
  @override
  Color get accent => Colors.purple.shade200;
  @override
  Color get background => Colors.grey.shade900;
  @override
  Color get surface => Colors.grey.shade700;
  @override
  Color get surfaceVariant => Colors.blueGrey.shade700;
}

class AppTheme {
  static ThemeData get light => LightAppTheme().themeData;
  static ThemeData get dark => DarkAppTheme().themeData;
}
