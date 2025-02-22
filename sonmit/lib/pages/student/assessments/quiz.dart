// pages/student/assessments/quiz.dart

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sonmit/components/button.dart';
import 'package:sonmit/components/card.dart';
import 'package:sonmit/components/progress_indicator.dart';
import 'package:sonmit/components/timer.dart';
import 'package:sonmit/pages/student/assessments/chat.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:sonmit/components/webview.dart';
import 'package:sonmit/services/callback.dart';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:url_launcher/url_launcher.dart';

// import 'package:google_fonts/google_fonts.dart';
// import 'package:sonmit/components/button.dart';
// import 'package:sonmit/components/card.dart';
// import 'package:sonmit/components/progress_indicator.dart';
// import 'package:sonmit/components/timer.dart';
// import 'package:sonmit/services/callback.dart';
import 'package:sonmit/services/flags.dart';
import 'package:sonmit/services/transitions.dart';
// import 'package:sonmit/services/flags.dart';

class QuizPage extends StatefulWidget {
  final String title;
  final bool isChecking; // Viewing Scores?

  const QuizPage({
    super.key,
    required this.title,
    this.isChecking = false,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  double progress = 1.0; // Initial progress is full (1.0)

  // answers from user
  bool? isSubmitted = false;

  bool isClosing = false;

  // Questions
  final List<Map<String, dynamic>> questions = [
    {
      "questionText": 'What is the capital of France?',
      "options": [
        'Berlin',
        'Madrid',
        'Paris',
        'Lisbon',
      ],
      "correctAnswerIndex": 2, // Paris is the correct answer (index 2)
      "explanation":
          "Paris is located in France. It has iconic sites like the Eiffel Tower"
    },
    {
      "questionText": 'Which planet is known as the Red Planet?',
      "options": [
        'Earth',
        'Mars. Elon Musk favourite next stop for his ambitions',
        'Jupiter',
        'Saturn'
      ],
      "correctAnswerIndex": 1, // Mars is the correct answer (index 1)
      "explanation":
          "Mars is the fourth planet of the solar system. It's redness can be attributed to it's arid surface"
    },
    {
      "questionText": 'Which planet is known as the Red Planet?',
      "options": [
        'Earth',
        'Mars. Elon Musk favourite next stop for his ambitions',
        'Jupiter',
        'Saturn'
      ],
      "correctAnswerIndex": 1, // Mars is the correct answer (index 1)
      "explanation": null
    },
    // Add more questions here...
  ];

  List<String?> selectedAnswers = [];

  // final GlobalKey webViewKey = GlobalKey();

  String url = '';
  // String title = '';
  // double progress = 0;
  // bool? isSecure;
  // InAppWebViewController? webViewController;

  @override
  void initState() {
    super.initState();
    // url = "https://google.com";
    selectedAnswers = widget.isChecking
        ? [
            null,
            'Mars. Elon Musk favourite next stop for his ambitions',
            'Earth'
          ]
        : List<String?>.filled(questions.length, null);
    if (widget.isChecking) isSubmitted = true;
    if (!kIsWeb) {
      if (Platform.isAndroid && !widget.isChecking) disableFlags();
    }
    if (widget.isChecking) isClosing = true;

    super.initState();
  }

  @override
  void dispose() {
    if (!kIsWeb) {
      if (Platform.isAndroid  && !widget.isChecking) enableFlags();
    }
    super.dispose();
  }

  // bool exitSession = false;
  Future<bool?> _showBackDialog() {
    return callDialog(
        context: context,
        content: Text(
            "Your current progress will be saved and submitted. \nYou will not be able to edit your responses after this."),
        title: "End quiz?",
        onConfirm: () {
          // Navigator.pop(context);
          // debugPrint("isClosing: $isClosing");
          // if (isClosing) {
          //   Navigator.pop(context);
          // }
          Navigator.pop(context, true);
          // setState(() {
          //   isClosing = true;
          // });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // pinned: true,
        leading: PopScope(
          canPop: widget.isChecking ? true : false,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) {
              return;
            }
            final bool shouldPop = await _showBackDialog() ?? false;
            if (context.mounted && shouldPop) {
              Navigator.pop(context);
            }
          },
          child: CupertinoNavigationBarBackButton(
            onPressed: () async {
              if (!widget.isChecking) {
                final bool shouldPop = await _showBackDialog() ?? false;
                if (context.mounted && shouldPop) {
                  Navigator.pop(context);
                }
              } else {
                Navigator.pop(context);
              }
              // widget.isChecking
              //     ?
              // Navigator.pop(context)
              // : callDialog(
              //     context: context,
              //     content: Text(
              //         "Your current progress will be saved and submitted. \nYou will not be able to edit your responses after this."),
              //     title: "End quiz?",
              //     onConfirm: () {
              //       Navigator.pop(context);
              //       // Navigator.pop(context);
              //     });
              // Navigator.pop(context);
            },
          ),
        ),
        actions: widget.isChecking
            ? [Text("Score: 20"), SizedBox(width: 10)]
            // : null,
            : [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CountdownTimer(
                    hours: 0,
                    minutes: 5,
                    onProgress: (timerProgress) {
                      setState(() {
                        progress = timerProgress;
                      });
                    },
                    onTimerComplete: () {
                      // Put Submit Logic Here

                      // Custom Navigation: Do not touch
                      Navigator.pop(context);
                      callDialog(
                        context: context,
                        showTitle: false,
                        showCancel: false,
                        barrierDismissible: false,
                        content: SizedBox(
                          height: 100,
                          child: Center(
                            child: Text(
                              "Session ended!",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        title: "",
                        showConfirm: false,
                        onConfirm: () {},
                        timeDialog: Duration(seconds: 3),
                      );
                    },
                  ),
                ),
              ],
        bottom: widget.isChecking
            ? null
            // : null,
            : PreferredSize(
                preferredSize: Size(double.maxFinite, 10),
                child: SmoothProgressIndicator(
                  minHeight: 10,
                  value: progress,
                ),
              ),
        title: Text(
          widget.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int questionIndex) {
              // return SizedBox();
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.1,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${questionIndex + 1}. ${questions[questionIndex]["questionText"]}",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (selectedAnswers[questionIndex] == null)
                      widget.isChecking
                          ? Text(
                              "No answer selected",
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w600,
                                // fontSize: 16,
                                color: Theme.of(context).colorScheme.error,
                              ),
                            )
                          : isSubmitted == null
                              ? Text(
                                  "*Required",
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w600,
                                    // fontSize: 16,
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                )
                              : SizedBox(),
                    // const SizedBox(height: 10),
                    Column(
                      children: questions[questionIndex]["options"]
                          .map<Widget>((String option) {
                        bool isCorrect = option ==
                            questions[questionIndex]["options"][
                                questions[questionIndex]["correctAnswerIndex"]];

                        // debugPrint(
                        //     "option: $option $questionIndex: $isCorrect");
                        // debugPrint("");

                        // Please do everything about this tile here
                        // I've pushed everything you need outside,
                        // Don't add extra parameters
                        return OptionTile(
                          option: option,
                          // bool accepts to indicate whether selected or not
                          explanation: questions[questionIndex]["explanation"],
                          isSelected: selectedAnswers[questionIndex] == option,
                          // bool indicates if selected option is correct(becomes active only when submitted)
                          isCorrect: (isSubmitted ?? false) && isCorrect,
                          // when user is checking for results
                          isChecking: widget.isChecking,

                          // when an option is tapped
                          onTap: () {
                            if (!(isSubmitted ?? false)) {
                              // setState(() {
                              selectedAnswers[questionIndex] = option;
                              // debugPrint("Option: $option");
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(
                              //     content: Text(
                              //       selectedAnswers.toString(),
                              //     ),
                              //   ),
                              // );
                              // });
                              setState(() {});
                            }
                          },
                        );
                      }).toList(),
                    ),
                    // const SizedBox(height: 2),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: Text(
                          "Need help with this question?",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context, slideLeftTransition(ChatPage()));
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              );
            },
            itemCount: questions.length,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.05,
            ),
            child: widget.isChecking
                ? null
                // : SizedBox(
                //     // clipBehavior: Clip.antiAlias,
                //     // decoration: BoxDecoration(
                //         // color: Colors.amber,
                //         // borderRadius: BorderRadius.circular(20)),
                //     height: MediaQuery.sizeOf(context).height,
                //     child: CustomWebView(url: url),
                //   )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FullButton(
                      onPressed: () {
                        debugPrint(selectedAnswers.toString());
                        if (!selectedAnswers.contains(null)) {
                          callDialog(
                              context: context,
                              content: Text(
                                  "You cannot edit your responses after this is done"),
                              title: "Complete quiz",
                              onConfirm: () {
                                setState(() {
                                  isSubmitted = true; // Mark quiz as submitted
                                });
                                Navigator.pop(context);
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Submitted")));
                              });
                        } else {
                          setState(() {
                            isSubmitted = null;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Please answer all questions")));
                        }
                      },
                      text: 'Submit',
                    ),
                  ),
          ),
          const SizedBox(height: 30),
        ]),
      ),
      // if (isSubmitted) // Show score after submission
      //   SliverToBoxAdapter(
      //     child: Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Text(
      //         'Your score is ${calculateScore(
      //           questions: questions,
      //           selectedAnswers: selectedAnswers,
      //         )} out of ${questions.length}.',
      //         style: const TextStyle(
      //           fontSize: 18,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     ),
      //   ),

      // floatingActionButton: widget.isChecking
      //     ? FloatingActionButton.extended(
      //         icon: Icon(Icons.help_outline),
      //         onPressed: () {},
      //         label: Text("Need help?"),
      //       )
      //     : null,
      // )
    );
  }
}
