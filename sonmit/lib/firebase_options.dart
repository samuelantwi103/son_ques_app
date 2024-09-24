// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBl3yEojzj2jxg3GeNdVGvu0C9LGgf884k',
    appId: '1:313740689842:web:fcd2242b1de7614b93a4ab',
    messagingSenderId: '313740689842',
    projectId: 'sonmit-app',
    authDomain: 'sonmit-app.firebaseapp.com',
    storageBucket: 'sonmit-app.appspot.com',
    measurementId: 'G-EB6X2XJS87',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQqtyV9u013J5-J397Y3f9E69f2LWT5sA',
    appId: '1:313740689842:ios:0ce65d23f8cb3e8593a4ab',
    messagingSenderId: '313740689842',
    projectId: 'sonmit-app',
    storageBucket: 'sonmit-app.appspot.com',
    iosBundleId: 'com.son.sonmit',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDQqtyV9u013J5-J397Y3f9E69f2LWT5sA',
    appId: '1:313740689842:ios:0ce65d23f8cb3e8593a4ab',
    messagingSenderId: '313740689842',
    projectId: 'sonmit-app',
    storageBucket: 'sonmit-app.appspot.com',
    iosBundleId: 'com.son.sonmit',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBl3yEojzj2jxg3GeNdVGvu0C9LGgf884k',
    appId: '1:313740689842:web:87a26efa4c63294f93a4ab',
    messagingSenderId: '313740689842',
    projectId: 'sonmit-app',
    authDomain: 'sonmit-app.firebaseapp.com',
    storageBucket: 'sonmit-app.appspot.com',
    measurementId: 'G-DPTJSYEHW6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAYaRq-KinnH6oo0cGqemUrj1u1SbTSAX8',
    appId: '1:313740689842:android:ee59f6608c7dfd4393a4ab',
    messagingSenderId: '313740689842',
    projectId: 'sonmit-app',
    storageBucket: 'sonmit-app.appspot.com',
  );

}