// pages/student/assessments/assesment.dart
import 'package:flutter/material.dart';
import 'package:sonmit/components/card.dart';
import 'package:sonmit/pages/student/assessments/quiz.dart';
import 'package:sonmit/services/callback.dart';
import 'package:sonmit/services/transitions.dart';

class AssesmentPage extends StatefulWidget {
  const AssesmentPage({super.key});

  @override
  State<AssesmentPage> createState() => _AssesmentPageState();
}

class _AssesmentPageState extends State<AssesmentPage> {
  bool isChecking = true;
  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> assessments = [
      {
        "title": "Quiz 1",
        "subject": "Elective Physics",
        "duration": "2hr 30min",
        "score": null,
        "dueDate": "Wed 10th Dec, 2024",
      },
      {
        "title": "Quiz 2",
        "subject": "Mathematics",
        "duration": "1hr 45min",
        "score": 90,
        "dueDate": "Fri 12th Dec, 2024",
      },
      {
        "title": "Midterm Assessment",
        "subject": "Biology",
        "duration": "3hr 00min",
        "score": null,
        "dueDate": "Mon 8th Dec, 2024",
      },
      {
        "title": "Final Exam",
        "subject": "Chemistry",
        "duration": "2hr 00min",
        "score": null,
        "dueDate": "Sun 15th Dec, 2024",
      },
      {
        "title": "Quiz 3",
        "subject": "History",
        "duration": "1hr 30min",
        "score": 65,
        "dueDate": "Tue 16th Dec, 2024",
      },
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            pinned: true,
            leading: SizedBox(),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Assessments",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              // background: Image.asset(
              //   'assets/books_1.jpeg',
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          // SliverPadding(
          //   padding: const EdgeInsets.fromLTRB(15.0, 15, 15, 0),
          //   sliver: SliverToBoxAdapter(
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         SizedBox(height: 20),
          //         Text(
          //           "Mocks",
          //           style: Theme.of(context).textTheme.headlineLarge?.copyWith(
          //                 fontWeight: FontWeight.bold,
          //                 color: Theme.of(context).colorScheme.secondary,
          //               ),
          //         ),
          //         SizedBox(height: 20),
          //       ],
          //     ),
          //   ),
          // ),
          // SliverConstrainedCrossAxis(
          //   maxExtent: 600,
          //   sliver: 
            SliverFillRemaining(
              // hasScrollBody: false,
              fillOverscroll: true,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: 
                    Container(
                      constraints: BoxConstraints(maxWidth: 600),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: assessments.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> assessment = assessments[index];
                          // Please let the code end here
                          // Everything needed has been provided here already
                          return ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 100),
                            child: AssessmentCard(
                              title: assessment["title"],
                              subject: assessment["subject"],
                              duration: assessment["duration"],
                              score: assessment["score"]?.toDouble(),
                              dueDate: assessment["dueDate"],
                              onViewScore: () {
                                Navigator.push(
                                  context,
                                  slideRightTransition(
                                   QuizPage(
                                      title: assessment["title"],
                                      isChecking: true,
                                    ),
                                  ),
                                );
                              },
                              onStart: () {
                                callDialog(
                                    context: context,
                                    content: Text(
                                        "The session cannot be paused or restarted"),
                                    title: "Start quiz?",
                                    onConfirm: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        slideLeftTransition(
                                          QuizPage(
                                            title: assessment["title"],
                                          ),
                                        ),
                                      );
                                    });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            // ),
          
        ],
      ),
    );
  }
}
