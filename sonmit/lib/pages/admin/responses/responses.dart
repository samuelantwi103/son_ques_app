// pages/student/dashboard.dart
import 'package:flutter/material.dart';
import 'package:sonmit/components/card.dart';
import 'package:sonmit/components/collapsible.dart';

class ResponsesPage extends StatefulWidget {
  const ResponsesPage({super.key});

  @override
  State<ResponsesPage> createState() => _ResponsesPageState();
}

class _ResponsesPageState extends State<ResponsesPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  List<Map<String, dynamic>> responses = [
    {
      "date": "Today",
      "quizzes": [
        {
          "id": 14,
          "subject": "Physics",
          "students": [
            {"s_id": "Student 1"},
            {"s_id": "Student 2"},
            {"s_id": "Student 3"},
            {"s_id": "Student 4"},
          ]
        },
        {
          "id": 12,
          "subject": "Physics",
          "students": [
            {"s_id": "Student 1"},
            {"s_id": "Student 2"},
            {"s_id": "Student 3"},
            {"s_id": "Student 4"},
          ]
        },
        {
          "id": 32,
          "subject": "Biology",
          "students": [
            {"s_id": "Student 1"},
            {"s_id": "Student 2"},
            {"s_id": "Student 3"},
            {"s_id": "Student 4"},
          ]
        },
        {
          "id": 15,
          "subject": "Biology",
          "students": [
            {"s_id": "Student 1"},
            {"s_id": "Student 2"},
            {"s_id": "Student 3"},
            {"s_id": "Student 4"},
          ]
        },
      ]
    },
    {
      "date": "Yesterday",
      "quizzes": [
        {
          "id": 1,
          "subject": "Chemistry",
          "students": [
            {"s_id": "Student 1"},
            {"s_id": "Student 2"},
            // {"s_id": "Student 3"},
            {"s_id": "Student 4"},
          ]
        },
        {
          "id": 2,
          "subject": "Chemistry",
          "students": [
            // {"s_id": "Student 1"},
            {"s_id": "Student 2"},
            {"s_id": "Student 3"},
            {"s_id": "Student 4"},
          ]
        },
        {
          "id": 1,
          "subject": "Physics",
          "students": [
            {"s_id": "Student 1"},
            {"s_id": "Student 2"},
            {"s_id": "Student 3"},
          ]
        },
        {
          "id": 2,
          "subject": "Physics",
          "students": [
            {"s_id": "Student 1"},
            {"s_id": "Student 2"},
            {"s_id": "Student 3"},
            {"s_id": "Student 4"},
          ]
        },
        {
          "id": 3,
          "subject": "Physics",
          "students": [
            {"s_id": "Student 1"},
            {"s_id": "Student 2"},
            // {"s_id": "Student 3"},
            {"s_id": "Student 4"},
          ]
        },
      ]
    },
    {
      "date": "2 days ago",
      "quizzes": [
        {
          "id": 1,
          "subject": "Chemistry",
          "students": [
            {"s_id": "Student 1"},
            {"s_id": "Student 2"},
            {"s_id": "Student 3"},
            // {"s_id": "Student 4"},
          ]
        },
        {
          "id": 2,
          "subject": "Chemistry",
          "students": [
            {"s_id": "Student 1"},
            // {"s_id": "Student 2"},
            {"s_id": "Student 3"},
            {"s_id": "Student 4"},
          ]
        },
      ]
    },
    {
      "date": "21st Dec, 2024",
      "quizzes": [
        {
          "id": 1,
          "subject": "Biology",
          "students": [
            {"s_id": "Student 1"},
            {"s_id": "Student 2"},
          ]
        },
        {
          "id": 2,
          "subject": "Biology",
          "students": [
            {"s_id": "Student 1"},
            {"s_id": "Student 2"},
            {"s_id": "Student 3"},
            {"s_id": "Student 4"},
          ]
        },
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        leading: SizedBox(),
        title: Text("R E S P O N S E S"),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(text: "Quiz"),
            Tab(text: "Mock"),
          ],
        ),
      ),
      body: TabBarView(controller: tabController, children: [
        // Quizzes
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: responses.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          responses[index]["date"],
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: responses[index]["quizzes"].length,
                          itemBuilder: (context, index2) {
                            List quizzes = responses[index]["quizzes"];
                            return ElevatedCollapsibleTile(
                                header: Text(
                                    "${responses[index]["quizzes"][index2]["subject"]}: Quiz ${quizzes[index2]["id"]}"),
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
                                          itemCount: quizzes[index2]["students"]
                                              .length,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index3) {
                                            final students =
                                                quizzes[index2]["students"];
                                            return ListTile(
                                              title: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: Text(
                                                  students[index3]["s_id"],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge,
                                                ),
                                              ),
                                              trailing: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                      Icons.more_vert_rounded)),
                                              contentPadding: EdgeInsets.all(0),
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
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 50,
                  );
                },
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),

        //Mock
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: responses.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          responses[index]["date"],
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: responses[index]["quizzes"].length,
                          itemBuilder: (context, index2) {
                            List quizzes = responses[index]["quizzes"];
                            return ElevatedCollapsibleTile(
                                header: Text(
                                    "${responses[index]["quizzes"][index2]["subject"]}: Mock ${quizzes[index2]["id"]}"),
                                content: [
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: DebossedCard(
                                        padding: EdgeInsets.all(0),
                                        borderRadius: BorderRadius.circular(10),
                                        child: ListView.separated(
                                          shrinkWrap: true,
                                          itemCount: quizzes[index2]["students"]
                                              .length,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index3) {
                                            final students =
                                                quizzes[index2]["students"];
                                            return ListTile(
                                              title: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: Text(
                                                  students[index3]["s_id"],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge,
                                                ),
                                              ),
                                              contentPadding: EdgeInsets.all(0),
                                              trailing: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                      Icons.more_vert_rounded)),
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
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 50,
                  );
                },
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ]),
    );
  }
}

// class ResponsesPageSecondary extends StatefulWidget {
//   const ResponsesPageSecondary({super.key});

//   @override
//   State<ResponsesPageSecondary> createState() => _ResponsesPageSecondaryState();
// }

// class _ResponsesPageSecondaryState extends State<ResponsesPageSecondary> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: SafeArea(
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.centerRight,
//               child: Text(
//                 DateFormat('EEE d MMMM, yyyy').format(DateTime.now()),
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             SizedBox(
//               height: MediaQuery.sizeOf(context).height - 100,
//               child: Center(
//                 child: Text("Profile"),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }
