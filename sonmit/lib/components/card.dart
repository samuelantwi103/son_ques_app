// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:sonmit/components/button.dart';

class CustomCard extends StatelessWidget {
  Widget child;
  CustomCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      constraints: BoxConstraints(minHeight: 20),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(
          //   color: Theme.of(context).colorScheme.surfaceContainer
          // ),

          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
              blurRadius: 5,
              spreadRadius: 5,
              offset: Offset(-5, -5),
            ),
            BoxShadow(
              color: Theme.of(context)
                  .colorScheme
                  .surfaceContainer
                  .withOpacity(0.8),
              blurRadius: 5,
              spreadRadius: 5,
              offset: Offset(5, 5),
            ),
          ]),
      child: child,
    );
  }
}

class QuizAnnouncementCard extends StatelessWidget {
  String title;
  String subject;
  String duration;
  String dueDate;
  void Function() onTap;

  QuizAnnouncementCard({
    super.key,
    required this.title,
    required this.subject,
    required this.duration,
    required this.dueDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CustomCard(
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Subject: $subject")),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("TIme Allowed: $duration")),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Due date: $dueDate")),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: OutlinedCustomButton(text: "Start", onPressed: onTap)),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class ResultAnnouncementCard extends StatelessWidget {
  String title;
  String subject;
  double score;
  // String duration;
  // String dueDate;
  void Function() onTap;

  ResultAnnouncementCard({
    super.key,
    required this.title,
    required this.subject,
    required this.score,
    // required this.duration,
    // required this.dueDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CustomCard(
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Subject: $subject")),
            Align(
                alignment: Alignment.centerLeft, child: Text("Score: $score%")),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedCustomButton(
                onPressed: () {},
                text: "View",
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
