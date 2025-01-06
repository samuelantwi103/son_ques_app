import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonmit/components/card.dart';
import 'package:sonmit/components/collapsible.dart';

class AdminQuizPage extends StatefulWidget {
  final String title;
  const AdminQuizPage({super.key, required this.title});

  @override
  State<AdminQuizPage> createState() => _AdminQuizPageState();
}

class _AdminQuizPageState extends State<AdminQuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        leading: CupertinoNavigationBarBackButton(),
        title: Text("Quiz: ${widget.title}"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Topics",
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
                      header: Text("Introduction to Physics"),
                      content: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: DebossedCard(
                              padding: EdgeInsets.all(0),
                              borderRadius: BorderRadius.circular(10),
                              // color: Theme.of(context)
                              //     .colorScheme
                              //     .surfaceContainer,
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: 3,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index3) {
                                  // final students = "quizzes[index2][]";
                                  return QuestionQuizCard(
                                      question:
                                          "Which of the following is a fundamental quantity?",
                                      answers: {
                                        "options": [
                                          "Velocity",
                                          "Mass",
                                          "Force",
                                          "Acceleration"
                                        ],
                                        "answer": 1,
                                        "explanation": "Mass cannot be expressed in terms of other quantities."
                                      });
                                },
                                separatorBuilder: (context, index) {
                                  return Divider();
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_comment_outlined),
      ),
    );
  }
}
