// pages/student/home.dart
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sonmit/components/adaptive_layout.dart';
import 'package:sonmit/pages/admin/questions/dashboard.dart';
import 'package:sonmit/pages/admin/responses/responses.dart';
import 'package:sonmit/pages/admin/performance/performance.dart';
import 'package:sonmit/pages/admin/settings.dart';
// import 'package:sonmit/pages/student/secondarybody.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      reset: true,
      destinationData: [
        {
          'icon': Icon(Icons.question_answer_outlined),
          'selectedIcon': Icon(Icons.question_answer_rounded),
          'label': 'Questions',
          'page': AdminDashboard(),
          'secondaryPage': AdminDashboardSecondary(),
        },
        {
          'icon': Icon(Icons.article_outlined),
          'selectedIcon': Icon(Icons.article),
          'label': 'Responses',
          'page': ResponsesPage(),
          'secondaryPage': null,
        },
        {
          'icon': Icon(Icons.people_outlined),
          'selectedIcon': Icon(Icons.people),
          'label': 'Students',
          'page': AdminPerformancePage(),
          'secondaryPage': null,
        },
        {
          'icon': Icon(Icons.settings_outlined),
          'selectedIcon': Icon(Icons.settings),
          'label': 'Settings',
          'page': AdminSettingsPage(),
          'secondaryPage': null,
        },
      ],
    );
  }
}
