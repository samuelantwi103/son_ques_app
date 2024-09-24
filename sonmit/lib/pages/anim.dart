// pages/anim.dart
import 'dart:math';

import 'package:flutter/material.dart';

class AnimPage extends StatefulWidget {
  const AnimPage({super.key});

  @override
  State<AnimPage> createState() => _AnimPageState();
}

class _AnimPageState extends State<AnimPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Hello"),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm_outlined), label: "AC"),
        ],
      ),
    );
  }
}
