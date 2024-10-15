// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sonmit/components/adaptive_layout.dart';
import 'package:sonmit/pages/student/assesment.dart';
import 'package:sonmit/pages/student/dashboard.dart';
import 'package:sonmit/pages/student/settings.dart';
// import 'package:sonmit/pages/student/secondarybody.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppLayout(
        destinationData: [
          {
            'icon': Icon(Icons.dashboard_outlined),
            'label': 'Dashboard',
            'page': UserDashboard(),
            'secondaryPage': UserDashboardSecondary(),
          },
          {
            'icon': Icon(Icons.assignment),
            'label': 'Assessments',
            'page': AssesmentPage(),
            'secondaryPage': null,
          },
          {
            'icon': Icon(Icons.settings),
            'label': 'Settings',
            'page': UserSettingsPage(),
            'secondaryPage': UserDashboard(),
          },
        ],
      ),
    );
  }
}
