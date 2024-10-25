// pages/student/mocks/mock.dart
import 'package:flutter/material.dart';
import 'package:sonmit/components/card.dart';
import 'package:sonmit/pages/student/mocks/exam.dart';
import 'package:sonmit/services/callback.dart';

class MockPage extends StatefulWidget {
  const MockPage({super.key});

  @override
  State<MockPage> createState() => _MockPageState();
}

class _MockPageState extends State<MockPage> {
  bool isChecking = true;
  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mocks = [
      {
        "title": "Mock 1",
        "subject": "Elective Physics",
        "duration": "2hr 30min",
        "score": null,
        "dueDate": "Wed 10th Dec, 2024",
      },
      {
        "title": "Mock 2",
        "subject": "Mathematics",
        "duration": "1hr 45min",
        "score": 90,
        "dueDate": "Fri 12th Dec, 2024",
      },
      {
        "title": "Mock 3",
        "subject": "Biology",
        "duration": "3hr 00min",
        "score": null,
        "dueDate": "Mon 8th Dec, 2024",
      },
      {
        "title": "Mock 4",
        "subject": "Chemistry",
        "duration": "2hr 00min",
        "score": null,
        "dueDate": "Sun 15th Dec, 2024",
      },
      {
        "title": "Mock 5",
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
                "Mock Exams",
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 500,
                ),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: mocks.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> mock = mocks[index];
                    // Please let the code end here
                    // Everything needed has been provided here already
                    return MockCard(
                      title: mock["title"],
                      subject: mock["subject"],
                      duration: mock["duration"],
                      score: mock["score"]?.toDouble(),
                      dueDate: mock["dueDate"],
                      onViewScore: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExamPage(
                              title: mock["title"],
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
                            title: "Start exam?",
                            onConfirm: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExamPage(
                                    title: mock["title"],
                                  ),
                                ),
                              );
                            });
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
