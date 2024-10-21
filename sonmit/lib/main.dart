// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sonmit/components/splash.dart';
import 'package:sonmit/themes/theme_provider.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode themeMode = ref.watch(themeNotifierProvider);
    return MaterialApp(
        title: 'SONMIT',
        debugShowCheckedModeBanner: false,
        theme:
            // MaterialTheme(TextTheme()).light().copyWith(
            //       snackBarTheme: SnackBarThemeData(
            //         showCloseIcon: true,
            //         behavior: SnackBarBehavior.floating,
            //       ),
            //     ),

            ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  dynamicSchemeVariant: DynamicSchemeVariant.content,
                  seedColor: Color(0xffcf5500),
                ),
                useMaterial3: true,
                snackBarTheme: SnackBarThemeData(
                  showCloseIcon: true,
                  behavior: SnackBarBehavior.floating,
                )),
        darkTheme:
            // MaterialTheme(TextTheme()).dark().copyWith(
            //       snackBarTheme: SnackBarThemeData(
            //         showCloseIcon: true,
            //         behavior: SnackBarBehavior.floating,
            //       ),
            //     ),

            ThemeData(
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
                )),
        themeMode: themeMode,
        home: SplashScreen());
  }
}
