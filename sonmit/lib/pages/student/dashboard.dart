// pages/student/dashboard.dart
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:intl/intl.dart';
import 'package:sonmit/components/card.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 15, 15, 0),
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                !Breakpoints.mediumAndUp.isActive(context)
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          DateFormat('EEE d MMMM, yyyy').format(DateTime.now()),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                    : const Text(""),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 10),
                    child: Text(
                      "Hey Samuel👋",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 10),
                    child: Text(
                      "SONMIT Points: 60",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: 170,
                    // height: 50,
                    // child: ElevatedCard(
                    // child: Center(
                    child: Text(
                      "Announcements",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    // ),
                    // ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ResultAnnouncementCard(
                    title: "Test results are in!!!",
                    score: 70,
                    subject: "Biology",
                    onTap: () {}),
                const SizedBox(
                  height: 20,
                ),
                QuizAnnouncementCard(
                    title: "Pending Quiz!!!",
                    subject: "Physics",
                    duration: "1hr 30min",
                    dueDate: "10th Dec, 2024, 10:59",
                    onTap: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserDashboardSecondary extends StatefulWidget {
  const UserDashboardSecondary({super.key});

  @override
  State<UserDashboardSecondary> createState() => _UserDashboardSecondaryState();
}

class _UserDashboardSecondaryState extends State<UserDashboardSecondary> {
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
                      "SON1001 ",
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
                        "Student One Name",
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
