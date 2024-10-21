import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExamPage extends StatefulWidget {
  String title;
  bool isChecking;
  ExamPage({
    super.key,
    required this.title,
    this.isChecking = false,
  });

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: CupertinoNavigationBarBackButton(),
        
        centerTitle: true,
      ),
      body: Scaffold(
        body: Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
      ),
    );
  }
}
