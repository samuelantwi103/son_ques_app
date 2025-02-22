// ignore_for_file: public_member_api_docs, sort_constructors_first
// components/card.dart
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sonmit/components/button.dart';
import 'package:sonmit/components/pdf/pdf_viewer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DebossedCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? shadowColorHigh;
  final Color? shadowColorLow;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;
  final AlignmentGeometry? alignment;
  // final EdgeInsetsGeometry? padding;
  // final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  // final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  // final Widget? child;
  final Clip? clipBehavior;

  const DebossedCard({
    super.key,
    required this.child,
    this.padding,
    this.color,
    this.borderRadius,
    this.shadowColorHigh,
    this.shadowColorLow,
    this.constraints,
    this.alignment,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.clipBehavior,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      constraints: constraints,
      alignment: alignment,
      // padding:,
      // color: color,
//  decoration:,
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      // BoxConstraints? constraints:,
      margin: margin,
      transform: transform,
      transformAlignment: transformAlignment,
      // Widget? child,
      clipBehavior: clipBehavior ?? Clip.none,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: shadowColorHigh?.withOpacity(0.5) ??
                Theme.of(context).colorScheme.surfaceContainer.withOpacity(0.8),
          ),
          top: BorderSide(
            color: shadowColorHigh?.withOpacity(0.5) ??
                Theme.of(context).colorScheme.surfaceContainer.withOpacity(0.8),
          ),
          right: BorderSide(
            color: shadowColorHigh?.withOpacity(0.5) ??
                Theme.of(context).colorScheme.surfaceContainer.withOpacity(0.8),
          ),
          left: BorderSide(
            color: shadowColorHigh?.withOpacity(0.5) ??
                Theme.of(context).colorScheme.surfaceContainer.withOpacity(0.8),
          ),
        ),
        borderRadius: borderRadius ?? BorderRadius.circular(50),
      ),
      child: Container(
        padding: padding ?? EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        // constraints: BoxConstraints(minHeight: 20),
        decoration: BoxDecoration(
            color: color ?? Theme.of(context).colorScheme.surface,
            borderRadius: borderRadius ?? BorderRadius.circular(20),
            // border: Border.all(
            //   color: Theme.of(context).colorScheme.surfaceContainer
            // ),

            boxShadow: [
              BoxShadow(
                color: shadowColorLow ??
                    Theme.of(context).colorScheme.surfaceContainerLowest,
                blurRadius: 5,
                spreadRadius: 5,
                offset: Offset(5, 5),
              ),
              BoxShadow(
                color: shadowColorHigh ??
                    Theme.of(context)
                        .colorScheme
                        .surfaceContainer
                        .withOpacity(0.8),
                blurRadius: 5,
                spreadRadius: 5,
                offset: Offset(-3, -3),
              ),
            ]),
        child: child,
      ),
    );
  }
}

class ElevatedCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? shadowColorHigh;
  final Color? shadowColorLow;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;
  final AlignmentGeometry? alignment;
  // final EdgeInsetsGeometry? padding;
  // final Color? color;
  // final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  // final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  // final Widget? child;
  final Clip? clipBehavior;

  const ElevatedCard({
    super.key,
    required this.child,
    this.padding,
    this.color,
    this.borderRadius,
    this.shadowColorHigh,
    this.shadowColorLow,
    this.constraints,
    this.alignment,
    // this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.clipBehavior,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      constraints: constraints,
      alignment: alignment,
      // padding:,
      // color: color,
//  decoration:,
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      // BoxConstraints? constraints:,
      margin: margin,
      transform: transform,
      transformAlignment: transformAlignment,
      // Widget? child,
      clipBehavior: clipBehavior ?? Clip.none,
      decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.surface,
          borderRadius: borderRadius ?? BorderRadius.circular(20),
          // border: Border.all(
          //   color: Theme.of(context).colorScheme.surfaceContainer
          // ),

          boxShadow: [
            BoxShadow(
              color: shadowColorLow ??
                  Theme.of(context).colorScheme.surfaceContainerLowest,
              blurRadius: 5,
              spreadRadius: 5,
              offset: Offset(-3, -3),
            ),
            BoxShadow(
              color: shadowColorHigh ??
                  Theme.of(context)
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
      child: ElevatedCard(
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
      child: ElevatedCard(
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

class TestAssessmentCard extends StatelessWidget {
  String title;
  String subject;
  String duration;
  double? score;
  String dueDate;
  void Function() onViewScore;
  void Function() onStart;

  TestAssessmentCard({
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
      //   // minHeight: 200,
      //   // height: 400,
      //   maxWidth: 100,
      //   maxHeight: Breakpoints.mediumAndUp.isActive(context) ? 330 : 400,
      // ),

      child: ElevatedCard(
        // constraints: BoxConstraints(minWidth: 300),
        width: 200,
        margin: EdgeInsets.fromLTRB(20, 40, 20, 20),
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Badge(
          isLabelVisible: score != null ? true : false,
          alignment: Alignment(.6, -0.6),
          backgroundColor: Colors.transparent,
          label: Icon(
            Icons.check_circle_outline_rounded,
            size: 50,
            // color: Theme.of(context).colorScheme.primaryContainer,
            color: Colors.green,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
              Text(
                duration,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      // color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              // Text(
              //   subject,
              //   style: Theme.of(context).textTheme.titleLarge?.copyWith(
              //         fontWeight: FontWeight.w600,
              //         color: Theme.of(context).colorScheme.secondary,
              //       ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   "Due: $dueDate",
              //   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              //         fontWeight: FontWeight.w600,
              //         // color: Theme.of(context).colorScheme.tertiary,
              //       ),
              // ),
              Expanded(child: SizedBox()),
              // Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     // mainAxisSize: MainAxisSize.min,
              //     // widthFactor: 1,
              //     // alignment: Alignment.centerRight,
              //     children: [
              //       Text(
              //         duration,
              //         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              //               fontWeight: FontWeight.w600,
              //               // color: Theme.of(context).colorScheme.tertiary,
              //             ),
              //       ),
              //     ]),

              SizedBox(
                height: 15,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 300),
                child: Column(
                  // shrinkWrap: true,
                  // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  //   maxCrossAxisExtent: 300,
                  //   mainAxisExtent: 45,
                  //   mainAxisSpacing: 10,
                  //   crossAxisSpacing: 10,
                  // ),
                  children: [
                    //  Expanded(
                    // child:
                    FullOutlineButton(
                        onPressed: onViewScore,
                        text: "View Score",
                        enabled: score != null ? true : false),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    // Expanded(
                    // child:
                    FullButton(
                        onPressed: onStart,
                        text: "Start Quiz",
                        enabled: score != null ? false : true),
                    // ),
                  ],
                ),
              ),
              // Breakpoints.mediumAndUp.isActive(context)
              // ? ConstrainedBox(
              //     constraints: BoxConstraints(
              //       maxWidth: 600,
              //     ),
              //     child: Row(mainAxisSize: MainAxisSize.min, children: [
              //       Expanded(
              //         child: FullOutlineButton(
              //             onPressed: onViewScore,
              //             text: "View Score",
              //             enabled: score == null ? true : false),
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Expanded(
              //         child: FullButton(
              //             onPressed: onStart,
              //             text: "Start Quiz",
              //             enabled: score == null ? false : true),
              //       ),
              //     ]),
              //   )

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
              // : Container(
              //     constraints: BoxConstraints(
              //       maxWidth: 800,
              //     ),
              //     child: Column(mainAxisSize: MainAxisSize.min, children: [
              //       FullOutlineButton(
              //           onPressed: onViewScore,
              //           text: "View Score",
              //           enabled: score == null ? true : false),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       FullButton(
              //           onPressed: onStart,
              //           text: "Start Quiz",
              //           enabled: score == null ? false : true),
              //     ]),
              //   ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
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
  void Function() onRetake;
  void Function() onChat;

  AssessmentCard({
    super.key,
    required this.title,
    required this.subject,
    required this.duration,
    required this.score,
    required this.dueDate,
    required this.onViewScore,
    required this.onStart,
    required this.onRetake,
    required this.onChat,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      // constraints: BoxConstraints(minWidth: 300),
      width: 200,
      // height: 10,
      margin: EdgeInsets.fromLTRB(5, 20, 5, 10),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        // minTileHeight: 400,
          leading: score != null
              ? Icon(
                  Icons.check_circle_outline_rounded,
                  size: 50,
                  // color: Theme.of(context).colorScheme.primaryContainer,
                  color: Colors.green,
                )
              : SizedBox(width: 20,),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          onTap: score == null ? onStart : null,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton.outlined(
                  onPressed: onChat, icon: Icon(Icons.chat_rounded)),
              IconButton.outlined(
                  onPressed: onViewScore, icon: Icon(Icons.assignment)),
              IconButton.outlined(
                  onPressed: onRetake, icon: Icon(Icons.replay_rounded)),
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
      child: ElevatedCard(
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
                          text: "Start Exam",
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
                        text: "Start Exam",
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

class OptionTile extends StatelessWidget {
  final String option;
  final String? explanation;
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
                  ? isCorrect
                      ? Colors.green.withOpacity(0.2)
                      : isSelected
                          ? (isCorrect
                              ? Colors.green.withOpacity(0.2)
                              : Colors.red.withOpacity(0.2))
                          : Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest
                  : isSelected
                      ? Theme.of(context).colorScheme.surfaceContainerHighest
                      : Theme.of(context).colorScheme.surfaceContainerLowest,
              border: Border.all(
                color: isChecking
                    ? isSelected
                        ? (isCorrect ? Colors.green : Colors.red)
                        : (isCorrect ? Colors.green : Colors.grey)
                    : Theme.of(context).colorScheme.primary,
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
          if (isCorrect && isChecking && explanation != null)
            Text("Explanation: \n$explanation"),
          if (isCorrect && isChecking && explanation != null)
            SizedBox(
              height: 10,
            )
        ],
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const SubjectCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ElevatedCard(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          )),
    );
  }
}

class QuestionMockCard extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const QuestionMockCard({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          title,
          // style: Theme.of(context)
          //     .textTheme
          //     .bodySmall,
        ),
      ),
      trailing: IconButton(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
          onPressed: () {},
          icon: Icon(Icons.more_vert_rounded)),
      contentPadding: EdgeInsets.all(0),
    );
  }
}

class QuestionQuizCard extends StatelessWidget {
  final String question;
  final Map answers;
  final void Function()? onTap;
  const QuestionQuizCard({
    super.key,
    required this.question,
    required this.answers,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Which of the following is a fundamental quantity?",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    answers["options"].asMap().entries.map<Widget>((entry) {
                  // Explicitly specify the Widget type
                  int index = entry.key;
                  String value = entry.value;

                  return Text(
                    "${String.fromCharCode(65 + index)}. $value", // 'A', 'B', 'C', etc.
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: answers["answer"] == index
                            ? FontWeight.bold
                            : FontWeight.normal),
                  );
                }).toList(), // Convert the mapped entries into a List<Widget>
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Explanation:",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                answers["explanation"],
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        isThreeLine: true,
        trailing: IconButton(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
            onPressed: () {},
            icon: Icon(Icons.more_vert_rounded)),
        contentPadding: EdgeInsets.all(0));
  }
}

class CreateMockCard extends StatefulWidget {
  final String title;
  final ValueChanged<bool?>? onTap;
  // bool value;
  final String questionPDF;
  CreateMockCard({
    super.key,
    required this.title,
    // required this.value,
    this.onTap,
    required this.questionPDF,
  });

  @override
  State<CreateMockCard> createState() => _CreateMockCardState();
}

class _CreateMockCardState extends State<CreateMockCard> {
  bool stateValue = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
      value: stateValue,
      onChanged: (value) {
        setState(() {
          stateValue = value ?? false;
        });
        if (widget.onTap != null) {
          widget.onTap!(value);
        }
      },
      isThreeLine: true,
      // onTap: onTap,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          widget.title,
          // style: Theme.of(context)
          //     .textTheme
          //     .bodySmall,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: ElevatedCard(
            borderRadius: BorderRadius.circular(0),
            padding: EdgeInsets.all(5),
            child: Center(
              child: PdfViewer(
                // getReadyState: (ready) {
                //   // setState(() {
                //     isReadyAns = ready;
                //   // });
                // },
                height: 250,
                selectedPdf: widget.questionPDF,
                scrollDirection: PdfScrollDirection.horizontal,
                // totalPages: _totalPages, currentPage: _currentPage, isPdfReady: _isPdfReady
              ),
            )),
      ),
      // secondary: IconButton(
      //     padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      //     onPressed: () {},
      //     icon: Icon(Icons.more_vert_rounded)),
      contentPadding: EdgeInsets.all(0),
    );
  }
}

class TopicCard extends StatelessWidget {
  final String topic;
  final int completed;
  final int total;
  final bool isActive;
  final void Function()? onTap;
  const TopicCard({
    super.key,
    required this.topic,
    required this.completed,
    required this.total,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return
        // Container(
        // clipBehavior: completed == total ? Clip.antiAlias : Clip.none,
        // decoration: completed == total
        //     ? BoxDecoration(color: Colors.green.shade50)
        //     : null,
        // child:
        ListTile(
      enabled: isActive,
      onTap: onTap,
      // colo: Colors.green.shade500,
      // selectedTileColor: Colors.green.shade500,
      leading: isActive
          ? completed == total
              ? Icon(
                  Icons.check_circle_outline_rounded,
                  size: 50,
                  // color: Theme.of(context).colorScheme.primaryContainer,
                  color: Colors.green,
                )
              : Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 5, 0),
                  child: CircularProgressIndicator.adaptive(
                    value: completed / total,
                    strokeCap: StrokeCap.round,
                    strokeWidth: 6,
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceContainer,
                  ),
                )
          : Icon(
              Icons.lock_outline_rounded,
              size: 50,
              // color: Theme.of(context).colorScheme.primaryContainer,
              // color: Colors.error,
            ),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Text(
          topic,
          // style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),

      // isThreeLine: true,
      // trailing: isActive?null:FullButton(text: "Unlock", onPressed: (){}),

      contentPadding: EdgeInsets.fromLTRB(5, 10, 8, 10),
      // titleAlignment: ListTileTitleAlignment.center,
      // ),
    );
  }
}
