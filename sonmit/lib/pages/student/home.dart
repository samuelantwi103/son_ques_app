// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sonmit/components/adaptive_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      destinationData: [
        {'icon': Icon(Icons.home), 'label': 'Home'},
        {'icon': Icon(Icons.assignment), 'label': 'Assignment'},
        {'icon': Icon(Icons.settings), 'label': 'Settings'},
      ],
      secondaryChildren: [
        // Card(
        //     child: Padding(
        //         padding: const EdgeInsets.all(50.0),
        //         child: Text('Home Content'))),
      ],
      children: [
        Card(
            child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text('Home Content'))),
        Card(
            child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text('Assignment Content'))),
        Card(
            child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text('Settings Content'))),
      ],
    );
  }
}
