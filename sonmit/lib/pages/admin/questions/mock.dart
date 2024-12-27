import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonmit/components/card.dart';
import 'package:sonmit/components/collapsible.dart';
import 'package:sonmit/pages/admin/questions/create_mock.dart';
import 'package:sonmit/pages/admin/questions/mock_details.dart';
import 'package:sonmit/services/transitions.dart';

class AdminMockPage extends StatefulWidget {
  final String title;
  const AdminMockPage({super.key, required this.title});

  @override
  State<AdminMockPage> createState() => _AdminMockPageState();
}

class _AdminMockPageState extends State<AdminMockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        leading: CupertinoNavigationBarBackButton(),
        title: Text("Mock: ${widget.title}"),
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
                      header: Text("States of Matter"),
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
                                  return QuestionMockCard(
                                    title: "Mock 23",
                                    onTap: () {
                                      Navigator.push(context, slideLeftTransition(AdminMockDetailsPage(title: "Mock 23")));
                                    },
                                    // style: Theme.of(context)
                                    //     .textTheme
                                    //     .bodySmall,
                                  );
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
        onPressed: () {
          Navigator.push(context, slideLeftTransition(CreateMockPage()));
        },
        child: Icon(Icons.add_comment_outlined),
      ),
    );
  }
}
