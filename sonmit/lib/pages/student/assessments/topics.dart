// pages/student/assessments/assesment.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonmit/components/card.dart';
import 'package:sonmit/pages/student/assessments/quiz.dart';
import 'package:sonmit/services/callback.dart';
import 'package:sonmit/services/transitions.dart';

class AssesmentTopicPage extends StatefulWidget {
  const AssesmentTopicPage({super.key});

  @override
  State<AssesmentTopicPage> createState() => _AssesmentTopicPageState();
}

class _AssesmentTopicPageState extends State<AssesmentTopicPage> {
  bool isChecking = true;
  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> assessments = [
      {
        "title": "Quiz 1",
        "subject": "Elective Physics",
        "duration": "2hr 30min",
        "score": 20,
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
        "title": "Quiz 3",
        "subject": "Biology",
        "duration": "3hr 00min",
        "score": null,
        "dueDate": "Mon 8th Dec, 2024",
      },
      {
        "title": "Quiz 4",
        "subject": "Chemistry",
        "duration": "2hr 00min",
        "score": null,
        "dueDate": "Sun 15th Dec, 2024",
      },
      {
        "title": "Quiz 5",
        "subject": "History",
        "duration": "1hr 30min",
        "score": null,
        "dueDate": "Tue 16th Dec, 2024",
      },
    ];

    return Scaffold(
      body: CustomScrollView(
        // center: Key("assessments"),

        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            pinned: true,
            leading: CupertinoNavigationBarBackButton(),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Introduction to Physics",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
          // SliverFillRemaining(
          //   child: ElevatedCard(child: SizedBox(
          //     height:10,
          //   )),
          // ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 0),
            sliver: SliverToBoxAdapter(
              // maxExtent: 600,
              // hasScrollBody: true,
              // fillOverscroll: true,
              child: Center(
                child: CustomScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  slivers: [
                    
                    // SliverConstrainedCrossAxis(
                    // maxExtent: 800,
                    // sliver:
                    SliverGrid.builder(
            
                      // physics: NeverScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 350,
                        mainAxisExtent: 350,
                        // mainAxisSpacing: 5,
                        crossAxisSpacing: 2,
            
                        // childAspectRatio: 0.75
                
                      ),
                      itemCount: assessments.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> assessment = assessments[index];
                        // Please let the code end here
                        // Everything needed has been provided here already
                        return AssessmentCard(
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
                                content: const Text(
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
                        );
                      },
                    ),
                    // )
                  ],
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
