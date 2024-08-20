// main.dart
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:son_ques_app/signin_page.dart';
import 'package:son_ques_app/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        primaryColor: Colors.orange,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SigninPage(),
        '/signup': (context) => SignupPage(),
        // Add more routes here
      },
    );
  }
}
