// services/flags.dart

  import 'package:flutter_windowmanager/flutter_windowmanager.dart';

Future<void> disableFlags() async {
     // Prevent screenshots
    FlutterWindowManager.addFlags(
      FlutterWindowManager.FLAG_SECURE,
    );

    // Keep Screen On
    FlutterWindowManager.addFlags(
      FlutterWindowManager.FLAG_KEEP_SCREEN_ON,
    );
  }

  Future<void> enableFlags() async {
    FlutterWindowManager.clearFlags(
      FlutterWindowManager.FLAG_SECURE,
    );

    // Keep Screen On
    FlutterWindowManager.clearFlags(
      FlutterWindowManager.FLAG_KEEP_SCREEN_ON,
    );
  }
