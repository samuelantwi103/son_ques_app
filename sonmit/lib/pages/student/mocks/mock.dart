// pages/student/mocks/mock.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sonmit/components/card.dart';
import 'package:sonmit/components/empty_screen.dart';
import 'package:sonmit/pages/student/mocks/exam.dart';
import 'package:sonmit/services/callback.dart';
import 'package:sonmit/services/transitions.dart';
import 'package:sonmit/themes/theme_provider.dart';

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

    final isDark = Provider.of<ThemeNotifier>(context, listen: true).isDarkMode;

    return Scaffold(
      // body: CustomScrollView(
      //   slivers: [
      // SliverAppBar(
      //   expandedHeight: 150.0,
      //   pinned: true,
      //   leading: SizedBox(),
      //   flexibleSpace: FlexibleSpaceBar(
      //     centerTitle: true,
      //     title: Text(
      //       "Mock Exams",
      //       style: Theme.of(context).textTheme.headlineSmall?.copyWith(
      //             fontWeight: FontWeight.bold,
      //             color: Theme.of(context).colorScheme.secondary,
      //           ),
      //     ),
      //     // background: Image.asset(
      //     //   'assets/books_1.jpeg',
      //     //   fit: BoxFit.cover,
      //     // ),
      //   ),
      // ),
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
      // SliverToBoxAdapter(
      //   child:
      body: Center(
        child: EmptyScreen(
          subtitle: "😎",
          title: "Coming Soon",
          description: "The mock feature will be available soon",
          animation:
              isDark ? "assets/upcoming_dark.json" : "assets/upcoming.json",
          repeat: true,
          width: 300,
        ),
      ),
      //   ),
      // ],
      // ),
    );
  }
}
