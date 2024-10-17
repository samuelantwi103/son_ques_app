// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sonmit/components/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SONMIT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepOrange,
              // surface: Colors.deepOrange[100],
            ),
            useMaterial3: true,
            snackBarTheme: SnackBarThemeData(
              showCloseIcon: true,
              behavior: SnackBarBehavior.floating,
            )),
        darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepOrange,
              brightness: Brightness.dark,
            ),
            brightness: Brightness.dark,
            useMaterial3: true,
            snackBarTheme: SnackBarThemeData(
              showCloseIcon: true,
              behavior: SnackBarBehavior.floating,
            )),
        themeMode: ThemeMode.light,
        home: SplashScreen());
  }
}
