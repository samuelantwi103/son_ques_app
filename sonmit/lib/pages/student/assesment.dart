import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:intl/intl.dart';
import 'package:sonmit/components/card.dart';
import 'package:sonmit/components/custom_scaffold.dart';
import 'package:sonmit/pages/student/quiz.dart';

class AssesmentPage extends StatefulWidget {
  const AssesmentPage({super.key});

  @override
  State<AssesmentPage> createState() => _AssesmentPageState();
}

class _AssesmentPageState extends State<AssesmentPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.sizeOf(context).height,
      // constraints: BoxConstraints(
      //   maxHeight: MediaQuery.sizeOf(context).height,
      // ),
      padding: const EdgeInsets.fromLTRB(15.0, 15, 15, 0),
      child: CustomScaffold(
        body: [
          SizedBox(
            height: 40,
          ),
          Text(
          "Assessment",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
          SizedBox(
            height: 20,
          ),
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return AssessmentCard(
                    title: "Quiz 2",
                    subject: "Elective Physics",
                    duration: "2hr 30min",
                    score: 20,
                    dueDate: "Wed 10th Dec, 2024",
                    onViewScore: () {},
                    onStart: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizPage(
                              title: "Quiz 2",
                            ),
                          ));
                    },
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
