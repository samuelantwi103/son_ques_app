import 'package:flutter/material.dart';
import 'package:sonmit/components/card.dart';
import 'package:sonmit/pages/student/mocks/exam.dart';

class MockPage extends StatefulWidget {
  const MockPage({super.key});

  @override
  State<MockPage> createState() => _MockPageState();
}

class _MockPageState extends State<MockPage> {
  @override
  Widget build(BuildContext context) {
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
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 2,
            (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 500,
                ),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return MockCard(
                      title: "Mock 2",
                      subject: "Elective Physics",
                      duration: "2hr 30min",
                      score: 20.toDouble(),
                      dueDate: "Wed 10th Dec, 2024",
                      onViewScore: () {},
                      onStart: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExamPage(
                                title: "Exam 2",
                              ),
                            ));
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
