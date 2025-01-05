// pages/student/assessments/assesment.dart
import 'package:flutter/material.dart';
import 'package:sonmit/components/card.dart';
import 'package:sonmit/components/collapsible.dart';
import 'package:sonmit/pages/student/assessments/quiz.dart';
import 'package:sonmit/pages/student/assessments/topics.dart';
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
        // center: Key("assessments"),

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
          // SliverFillRemaining(
          //   child: ElevatedCard(child: SizedBox(
          //     height:10,
          //   )),
          // ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(25.0, 0, 25, 0),
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
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Subjects",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ElevatedCollapsibleTile(
                                    header: Text("Physics"),
                                    content: [
                                      Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: DebossedCard(
                                            padding: EdgeInsets.all(0),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            clipBehavior: Clip.antiAlias,

                                            // color: Theme.of(context)
                                            //     .colorScheme
                                            //     .surfaceContainer,
                                            child: ListView.separated(
                                              shrinkWrap: true,
                                              itemCount: 5,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index3) {
                                                // final students = "quizzes[index2][]";
                                                return TopicCard(
                                                  topic:
                                                      "Introduction to Physics",
                                                  completed: index3 == 0 ||
                                                          index3 == 1 ||
                                                          index3 == 2
                                                      ? index3 == 2
                                                          ? 15
                                                          : 20
                                                      : 0,
                                                  total: 20,
                                                  isActive: index3 == 0 ||
                                                      index3 == 1 ||
                                                      index3 == 2 ||
                                                      index3 == 3,
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        slideLeftTransition(
                                                            AssesmentTopicPage()));
                                                  },
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return Divider(
                                                  height: 1,
                                                );
                                              },
                                            )),
                                      )
                                    ]);
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 30,
                                );
                              },
                              itemCount: 4),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      ),
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
