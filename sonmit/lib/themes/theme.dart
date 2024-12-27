// ../../washking/washking/lib/themes/theme.dart
import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) {return ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  dynamicSchemeVariant: DynamicSchemeVariant.content,
                  seedColor: Color(0xffcf5500),
                ),
                useMaterial3: true,
                snackBarTheme: SnackBarThemeData(
                  showCloseIcon: true,
                  behavior: SnackBarBehavior.floating,
                ));}

ThemeData darkTheme(BuildContext context) {return ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  dynamicSchemeVariant: DynamicSchemeVariant.content,
                  seedColor: Color(0xffcf5500),
                  // tertiary: Color(0xffcf5500),
                  brightness: Brightness.dark,
                ),
                brightness: Brightness.dark,
                useMaterial3: true,
                snackBarTheme: SnackBarThemeData(
                  showCloseIcon: true,
                  behavior: SnackBarBehavior.floating,
                ));}
