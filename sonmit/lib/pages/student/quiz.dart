import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonmit/components/custom_scaffold.dart';

class QuizPage extends StatefulWidget {
  String title;
  QuizPage({
    super.key,
    required this.title,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: CupertinoNavigationBarBackButton(),
        // title:
        centerTitle: true,
      ),
      body: CustomScaffold(body: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ]),
    );
  }
}
