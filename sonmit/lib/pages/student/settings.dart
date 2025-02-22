// pages/student/settings.dart
import 'package:flutter/material.dart';
import 'package:sonmit/components/card.dart';
import 'package:sonmit/pages/signin_page.dart';
import 'package:sonmit/services/transitions.dart';
import 'package:sonmit/themes/theme_switch.dart';

class UserSettingsPage extends StatefulWidget {
  const UserSettingsPage({super.key});

  @override
  State<UserSettingsPage> createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  bool isChecking = true;
  bool isSubmitted = false;

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
              "Settings",
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
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Profile",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () => Navigator.pushReplacement(context, slideDownTransition(SigninPage())),
                  child: ElevatedCard(
                      child: Text(
                    "Logout",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary
                    ),
                  )),
                )
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
            Text(
              "Security",
              style: Theme.of(context).textTheme.titleLarge,
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
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text("Change Password"),
                        trailing: Icon(Icons.lock_rounded),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Extras",
              style: Theme.of(context).textTheme.titleLarge,
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
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text("Theme"),
                        trailing: ThemeSwitch(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
        ),
      ],
    ));
  }
}
