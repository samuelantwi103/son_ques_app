// pages/student/dashboard.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sonmit/components/card.dart';
import 'package:sonmit/pages/admin/questions/mock.dart';
import 'package:sonmit/pages/admin/questions/quiz.dart';
import 'package:sonmit/services/transitions.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  List<String> subjects = [
    "Physics",
    "Chemistry",
    "Biology",
    "Eletive Mathematics"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        leading: SizedBox(),
        title: Text("Q U E S T I O N S"),
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
          // width: double.maxFinite,
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Subjects",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 30,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                return SubjectCard(
                  title: subjects[index],
                  onTap: () {
                    Navigator.push(
                        context,
                        slideLeftTransition(AdminQuizPage(
                          title: subjects[index],
                        )));
                  },
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 40,
                );
              },
            )
          ]),
        ),

        // Mock
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            // width: double.maxFinite,
            padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return SubjectCard(
                    title: subjects[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        slideLeftTransition(AdminMockPage(
                          title: subjects[index],
                        )));
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 40,
                  );
                },
              )
            ]),
          ),
        ),
      ]),
    );
  }
}

class AdminDashboardSecondary extends StatefulWidget {
  const AdminDashboardSecondary({super.key});

  @override
  State<AdminDashboardSecondary> createState() => _AdminDashboardSecondaryState();
}

class _AdminDashboardSecondaryState extends State<AdminDashboardSecondary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                DateFormat('EEE d MMMM, yyyy').format(DateTime.now()),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(
              //   "Profile",
              //   style: Theme.of(context).textTheme.titleLarge,
              // ),
              SizedBox(width: 10),
              
            ],
                        ),
                        SizedBox(
            height: 30,
                        ),
                        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  child: ElevatedCard(
                    padding: EdgeInsets.all(30),
                    borderRadius: BorderRadius.circular(100),
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "ID: ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "SON1202 ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.normal),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name: ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Flexible(
                      child: Text(
                        "Tutor One Name",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                )
              ],
            ),
                        ),
                        SizedBox(
            height: 30,
                        ),
                        
                      ],
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}
