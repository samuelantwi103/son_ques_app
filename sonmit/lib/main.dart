// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:sonmit/components/splash.dart';
import 'package:sonmit/themes/theme.dart';
import 'package:sonmit/themes/theme_provider.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Permission.camera.request();
  // await Permission.microphone.request();
  // await Permission.storage.request();

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.windows) {
    final availableVersion = await WebViewEnvironment.getAvailableVersion();
    assert(availableVersion != null,
        'Failed to find an installed WebView2 runtime or non-stable Microsoft Edge installation.');

    WebViewEnvironment webview  = await WebViewEnvironment.create(
        settings: WebViewEnvironmentSettings(userDataFolder: 'custom_path'));
  }

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }
  runApp(
    ChangeNotifierProvider(
    create: (context) => ThemeNotifier(),
    child:
       const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeMode themeMode = Provider.of<ThemeNotifier>(context).themeData;
    return MaterialApp(
        title: 'SONMIT',
        debugShowCheckedModeBanner: false,
        theme: lightTheme(context),
            
        darkTheme:darkTheme(context),
        themeMode: themeMode,
        home: SplashScreen());
  }
}
