import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a StateNotifier to manage the ThemeMode
class ThemeNotifier with ChangeNotifier {
  ThemeMode _themeData = ThemeMode.light;

  ThemeMode get themeData => _themeData;

  bool get isDarkMode => _themeData == ThemeMode.dark;

  set themeData(ThemeMode themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    _themeData == ThemeMode.light ? themeData = ThemeMode.dark : themeData = ThemeMode.light;
  }
}
