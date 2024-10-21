import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';

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
      // constraints: BoxConstraints(minHeight: 20),
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
              offset: Offset(-3, -3),
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

class AssessmentCard extends StatelessWidget {
  String title;
  String subject;
  String duration;
  double? score;
  String dueDate;
  void Function() onViewScore;
  void Function() onStart;

  AssessmentCard({
    super.key,
    required this.title,
    required this.subject,
    required this.duration,
    required this.score,
    required this.dueDate,
    required this.onViewScore,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(
      //   minHeight: 200,
      // height: 400,
      height: Breakpoints.mediumAndUp.isActive(context) ? 330 : 400,
      //   maxWidth: 500,
      // ),
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CustomCard(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subject,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Due: $dueDate",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            // color: Theme.of(context).colorScheme.tertiary,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                duration,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      // color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Breakpoints.mediumAndUp.isActive(context)
            ? Row(children: [
                    Expanded(
                      child: FullOutlineButton(
                          onPressed: onViewScore,
                          text: "View Score",
                          enabled: score == null ? true : false),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: FullButton(
                          onPressed: onStart,
                          text: "Start Quiz",
                          enabled: score == null ? false : true),
                    ),
                  ])
                // ? Row(children: [
                //     Expanded(
                //       child: FullOutlineButton(
                //         onPressed: onViewScore,
                //         text: "View Score",
                //       ),
                //     ),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Expanded(
                //       child: FullButton(
                //         onPressed: onStart,
                //         text: "Start Quiz",
                //       ),
                //     ),
                //   ])
                : Column(children: [
                    FullOutlineButton(
                        onPressed: onViewScore,
                        text: "View Score",
                        enabled: score == null ? true : false),
                    SizedBox(
                      height: 10,
                    ),
                    FullButton(
                        onPressed: onStart,
                        text: "Start Quiz",
                        enabled: score == null ? false : true),
                  ]),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class MockCard extends StatelessWidget {
  String title;
  String subject;
  String duration;
  double? score;
  String dueDate;
  void Function() onViewScore;
  void Function() onStart;

  MockCard({
    super.key,
    required this.title,
    required this.subject,
    required this.duration,
    required this.score,
    required this.dueDate,
    required this.onViewScore,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(
      //   minHeight: 200,
      // height: 400,
      height: Breakpoints.mediumAndUp.isActive(context) ? 330 : 400,
      //   maxWidth: 500,
      // ),
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CustomCard(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subject,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Due: $dueDate",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            // color: Theme.of(context).colorScheme.tertiary,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                duration,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      // color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Breakpoints.mediumAndUp.isActive(context)
                ? Row(children: [
                    Expanded(
                      child: FullOutlineButton(
                        onPressed: onViewScore,
                        text: "View Score",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: FullButton(
                        onPressed: onStart,
                        text: "Start Exam",
                      ),
                    ),
                  ])
                : Column(children: [
                    FullOutlineButton(
                      onPressed: onViewScore,
                      text: "View Score",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FullButton(
                      onPressed: onStart,
                      text: "Start Exam",
                    ),
                  ]),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final String option;
  final String explanation;
  final bool isSelected;
  final bool isCorrect; // Add a property to track correctness
  bool isChecking;
  final VoidCallback onTap;

  OptionTile({
    required this.option,
    required this.isSelected,
    required this.explanation,
    required this.isCorrect,
    required this.onTap,
    required this.isChecking,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // debugPrint("option: $option correct: $isCorrect");
    return GestureDetector(
      onTap: isChecking ? null : onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: isChecking
                  ? (!isCorrect
                      ? isSelected
                          ? (isCorrect
                              ? Colors.green.withOpacity(0.2)
                              : Colors.red.withOpacity(0.2))
                          : Theme.of(context).colorScheme.surfaceContainer
                      : Colors.green.withOpacity(0.2))
                  : isSelected
                      ? Theme.of(context).colorScheme.surfaceContainer
                      : Theme.of(context).colorScheme.surfaceContainerLowest,
              border: Border.all(
                color: !isChecking
                    ? Theme.of(context).colorScheme.primary
                    : isSelected
                        ? (isCorrect ? Colors.green : Colors.red)
                        : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    option,
                    style: GoogleFonts.dmSans(
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal),
                  ),
                ),
                if (isCorrect && isChecking)
                  const Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                if (isSelected && !isCorrect && isChecking)
                  const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
              ],
            ),
          ),
          if (isCorrect && isChecking)
          Text("Explanation: \n$explanation"),
          if (isCorrect && isChecking)
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
