// pages/student/home.dart
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sonmit/components/adaptive_layout.dart';
import 'package:sonmit/pages/admin/settings.dart';
import 'package:sonmit/pages/student/assessments/assesment.dart';
import 'package:sonmit/pages/student/dashboard.dart';
import 'package:sonmit/pages/student/mocks/mock.dart';
import 'package:sonmit/pages/student/settings.dart';
// import 'package:sonmit/pages/student/secondarybody.dart';

class HomePage extends StatefulWidget {
  final bool reset;
  const HomePage({super.key, this.reset = false,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      reset: widget.reset,
      destinationData: [
        {
          'icon': Icon(Icons.dashboard_outlined),
          'selectedIcon': Icon(Icons.dashboard),
          'label': 'Dashboard',
          'page': UserDashboard(),
          'secondaryPage': UserDashboardSecondary(),
        },
        {
          'icon': Icon(Icons.assessment_outlined),
          'selectedIcon': Icon(Icons.assessment),
          'label': 'Assessments',
          'page': AssesmentPage(),
          'secondaryPage': null,
        },
        {
          'icon': Icon(Icons.article_outlined),
          'selectedIcon': Icon(Icons.article),
          'label': 'Mocks',
          'page': MockPage(),
          'secondaryPage': null,
        },
        {
          'icon': Icon(Icons.settings_outlined),
          'selectedIcon': Icon(Icons.settings),
          'label': 'Settings',
          'page': UserSettingsPage(),
          'secondaryPage': null,
        },
      ],
    );
  }
}
