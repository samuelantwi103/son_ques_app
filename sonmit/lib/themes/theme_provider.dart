import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a StateNotifier to manage the ThemeMode
class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light);

  void toggleTheme() {
    // state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    if (state ==  ThemeMode.light) {
      state =  ThemeMode.dark;
    } else {
      state = ThemeMode.light;
    }
    // return state == ThemeMode.light ? true : false;
  }
}

// Create a provider for ThemeNotifier
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
  (ref) {
    return ThemeNotifier();
  },


);
