// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sonmit/components/adaptive_layout.dart';
import 'package:sonmit/pages/signin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SONMIT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepOrange,
          ),
          useMaterial3: true,
          snackBarTheme: SnackBarThemeData(
            showCloseIcon: true,
            behavior: SnackBarBehavior.floating,
          )),
      darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.orange, brightness: Brightness.dark),
          brightness: Brightness.dark,
          useMaterial3: true,
          snackBarTheme: SnackBarThemeData(
            showCloseIcon: true,
            behavior: SnackBarBehavior.floating,
          )),
      themeMode: ThemeMode.light,
      home: SigninPage()
    );
  }
}
